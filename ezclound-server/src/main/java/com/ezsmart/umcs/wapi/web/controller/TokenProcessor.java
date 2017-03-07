package com.ezsmart.umcs.wapi.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class TokenProcessor {

    private static TokenProcessor instance = new TokenProcessor();

    private long previous;

    protected TokenProcessor() {
    }

    public static TokenProcessor getInstance() {
        return instance;
    }

    public synchronized boolean isTokenValid(HttpServletRequest request) {
        return isTokenValid(request, false);
    }

    public synchronized boolean isTokenValid(HttpServletRequest request, boolean reset) {

        HttpSession session = request.getSession(false);
        if (session == null)
            return false;
        String saved = (String) session.getAttribute("cn.vicky.struts.action.TOKEN");
        if (saved == null)
            return false;

        if (reset)
            resetToken(request);
        String token = request.getParameter("cn.vicky.struts.taglib.html.TOKEN");
        if (token == null)
            return false;
        else
            return saved.equals(token);
    }

    public synchronized void resetToken(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        } else {
            session.removeAttribute("cn.vicky.struts.action.TOKEN");
            return;
        }
    }

    public synchronized void saveToken(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String token = generateToken(request);
        if (token != null)
            session.setAttribute("cn.vicky.struts.action.TOKEN", token);
    }

    public synchronized String generateToken(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return null;// generateToken(session.getId());
    }
}
