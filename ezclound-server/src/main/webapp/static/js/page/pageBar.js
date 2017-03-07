var PageItemFirst = React.createClass({
    displayName: "PageItemFirst",
    handleChangePage: function () {
        if (this.props.data.pageNum != 1) {
            this.props.onChangePage(1);
        }
    },
    render: function () {
        var className = "paginate_button";
        if (this.props.data.pageNum == 1) {
            className = "paginate_button disabled";
        }

        return (
            React.createElement("li", {className: className},
                React.createElement("a", {
                    onClick: this.handleChangePage,
                    href: "javascript:void(0)"
                }, this.props.data.firstText)
            )
        );
    }
});

var PageItemLast = React.createClass({
    displayName: "PageItemLast",
    handleChangePage: function () {
        if (this.props.data.pageNum != this.props.data.pageCount) {
            this.props.onChangePage(this.props.data.pageCount);
        }
    },
    render: function () {
        var className = "paginate_button";
        if (this.props.data.pageNum == this.props.data.pageCount) {
            className = "paginate_button disabled";
        }

        return (
            React.createElement("li", {className: className},
                React.createElement("a", {
                    onClick: this.handleChangePage,
                    href: "javascript:void(0)"
                }, this.props.data.lastText)
            )
        );
    }
});

var PageItemBlank = React.createClass({
    displayName: "PageItemBlank",
    render: function () {
        return (
            React.createElement("li", {className: "paginate_button"}, React.createElement("a", {href: "javascript:void(0)"}, "..."))
        );
    }
});


var PageItem = React.createClass({
    displayName: "PageItem",
    handleChangePage: function () {
        if (this.props.index != this.props.data.pageNum) {
            this.props.onChangePage(this.props.index);
        }
    },
    render: function () {
        var className = "paginate_button";
        if (this.props.index == this.props.data.pageNum) {
            className = "paginate_button active";
        }

        return (
            React.createElement("li", {className: className},
                React.createElement("a", {onClick: this.handleChangePage, href: "javascript:void(0)"}, this.props.index)
            )
        );
    }
});

var PageBar = React.createClass({
    displayName: "PageBar",
    render: function () {
        var html = [];
        html.push(React.createElement(PageItemFirst, {
            data: this.props.pageData,
            onChangePage: this.props.onChangePage
        }));

        if (this.props.pageData.pageNum > this.props.pageData.barSize + 1) {
            html.push(React.createElement(PageItemBlank, null));
        }

        if (this.props.pageData.pageNum <= this.props.pageData.barSize) {
            if (this.props.pageData.pageCount - this.props.pageData.pageNum > this.props.pageData.barSize) {
                for (var i = 1; i <= this.props.pageData.pageNum + this.props.pageData.barSize; i++) {
                    html.push(React.createElement(PageItem, {
                        index: i,
                        data: this.props.pageData,
                        onChangePage: this.props.onChangePage
                    }));
                }
            } else {
                for (var i = 1; i <= this.props.pageData.pageCount; i++) {
                    html.push(React.createElement(PageItem, {
                        index: i,
                        data: this.props.pageData,
                        onChangePage: this.props.onChangePage
                    }));
                }
            }
        } else {
            if (this.props.pageData.pageCount - this.props.pageData.pageNum > this.props.pageData.barSize) {
                for (var i = this.props.pageData.pageNum - this.props.pageData.barSize; i <= this.props.pageData.pageNum + this.props.pageData.barSize; i++) {
                    html.push(React.createElement(PageItem, {
                        index: i,
                        data: this.props.pageData,
                        onChangePage: this.props.onChangePage
                    }));
                }
            } else {
                for (var i = this.props.pageData.pageNum - this.props.pageData.barSize; i <= this.props.pageData.pageCount; i++) {
                    html.push(React.createElement(PageItem, {
                        index: i,
                        data: this.props.pageData,
                        onChangePage: this.props.onChangePage
                    }));
                }
            }
        }

        if (this.props.pageData.pageCount - this.props.pageData.pageNum > this.props.pageData.barSize) {
            html.push(React.createElement(PageItemBlank, null));
        }

        html.push(React.createElement(PageItemLast, {
            data: this.props.pageData,
            onChangePage: this.props.onChangePage
        }));
        return (
            React.createElement("div", null,
                React.createElement("ul", {className: "pagination pagination-sm no-margin pull-right"},
                    html
                ),
                React.createElement("span", {
                    style: {
                        display: "inline-block",
                        lineHeight: '28px'
                    }
                }, "共", this.props.pageData.total, "条,", this.props.pageData.pageCount, "页")
            )
        );
    }
});