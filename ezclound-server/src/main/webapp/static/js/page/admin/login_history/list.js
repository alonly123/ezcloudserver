var SearchBar = React.createClass({
    displayName: "SearchBar",
    render: function () {
        return (
            React.createElement("button", {
                    type: "button",
                    className: "btn btn-primary btn-flat",
                    onClick: this.props.onSearchBar
                }, "搜索"
            )
        );
    }
});

var SearchBox = React.createClass({
    displayName: "SearchBox",
    handleChange: function () {
        this.props.onKeywordInput(
            this.refs.keywordTextInput.value
        );
    },

    render: function () {
        return (
            React.createElement("input", {
                type: "text",
                name: "key",
                ref: "keywordTextInput",
                placeholder: "账号",
                onChange: this.handleChange,
                className: "form-control",
                value: this.props.keyword
            })
        );
    }
});

var SearchArea = React.createClass({
    displayName: "SearchArea",

    render: function () {
        return (
            React.createElement("div", {className: "input-group ", style: {width: '300px', float: 'left'}},
                React.createElement(SearchBox, {
                    onKeywordInput: this.props.onKeywordInput,
                    keyword: this.props.keyword
                }),
                React.createElement("span", {className: "input-group-btn"},
                    React.createElement(SearchBar, {onSearchBar: this.props.onSearchBar})
                )
            )
        );
    }
});

var LoginHistoryTableRow = React.createClass({
    displayName: "LoginHistoryTableRow",
    render: function () {
        return (
            React.createElement("tr", null,
                React.createElement("td", null, this.props.rowData['id']),
                React.createElement("td", null, this.props.rowData['ucode']),
                React.createElement("td", null, this.props.rowData['ip']),
                React.createElement("td", null, this.props.rowData['loginTimeStr'])
            )
        );
    }
});

var LoginHistoryTable = React.createClass({
    displayName: "LoginHistoryTable",
    getInitialState: function () {
        return {
            data: [],
            keyword: '',
            pageNum: 1
        };
    },
    handleKeywordInput: function (keyword) {
        this.setState({
            keyword: keyword,
            pageNum: 1
        })
    },
    handleSearchBar: function () {
        this.loadData();
    },
    handleChangePage: function (pageNum) {
        this.setState({
            keyword: this.state.keyword,
            pageNum: pageNum
        }, function () {
            this.loadData();
        });
    },
    componentDidMount: function () {
        this.loadData();
    },
    loadData: function () {
        $.ajax({
            url: this.props.url,
            dataType: 'json',
            type: 'POST',
            cache: false,
            data: {keyword: this.state.keyword, pageNum: this.state.pageNum},
            success: function (data) {
                if (this.isMounted()) {
                    var self = this;
                    this.setState({
                        data: data
                    }, function () {
                        $('#js_table').dataTable({
                            "language": {
                                "emptyTable": "没有数据"
                            },
                            "paging": false,
                            "lengthChange": false,
                            "searching": false,
                            "ordering": true,
                            "info": false,
                            "autoWidth": false,
                            "bProcessing": true,
                            "bRetrieve": true
                        });
                    });


                }
            }.bind(this),
            error: function (xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    },
    render: function () {
        var rows = [];

        var pageBox = "";
        var keywords = this.state.keyword;
        if (this.state.data.data) {

            var resultData = this.state.data.data;
            var pageData = {
                pageNum: resultData.pageNum,
                pageSize: resultData.pageSize ? resultData.pageSize : 1,
                total: resultData.total ? resultData.total : 0,
                firstText: '首页',
                lastText: '尾页',
                blank: '...',
                barSize: 6,
                pageCount: Math.ceil(resultData.total / resultData.pageSize)
            };
            pageBox = React.createElement(PageBar, {pageData: pageData, onChangePage: this.handleChangePage});
            this.state.data.data.data.forEach(function (rowData) {
                rows.push(React.createElement(LoginHistoryTableRow, {rowData: rowData}))
            });
        }

        return (
            React.createElement("div", null,
                React.createElement("div", {className: "box-body"},
                    React.createElement(SearchArea, {
                        keyword: keywords,
                        onKeywordInput: this.handleKeywordInput,
                        onSearchBar: this.handleSearchBar
                    }),
                    React.createElement("table", {id: "js_table", className: "table table-bordered table-hover"},
                        React.createElement("thead", null,
                            React.createElement("tr", null,
                                React.createElement("th", null, "序号"),
                                React.createElement("th", null, "账号"),
                                React.createElement("th", null, "登录IP"),
                                React.createElement("th", null, "登录时间")
                            )
                        ),
                        React.createElement("tbody", null,
                            rows
                        )
                    )
                ),
                React.createElement("div", {className: "box-footer clearfix"},
                    pageBox
                )
            )
        );
    }
});


ReactDOM.render(
    React.createElement(LoginHistoryTable, {url: "/admin/loginHistory/r/list"}),
    document.getElementById('container')
);