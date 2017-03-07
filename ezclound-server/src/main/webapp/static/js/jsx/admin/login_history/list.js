var SearchBar = React.createClass({
        render: function () {
            return (
                < button
            type = "button"
            className = "btn btn-primary btn-flat"
            onClick = {this.props.onSearchBar
        } > 搜索
        < / button >
);
}
})
;

var SearchBox = React.createClass({
    handleChange: function()
{
    this.props.onKeywordInput(
        this.refs.keywordTextInput.value
    );
}
,

render: function () {
    return (
        < input
    type = "text"
    name = "key"
    ref = "keywordTextInput"
    placeholder = "账号"
    onChange = {this.handleChange
}
className = "form-control"
value = {this.props.keyword
}/>
)
;
}
})
;

var SearchArea = React.createClass({

    render: function()
{
    return (
        < div
    className = "input-group "
    style = {
    {
        width: '300px', float
    :
        'left'
    }
}
>
<
SearchBox
onKeywordInput = {this.props.onKeywordInput
}
keyword = {this.props.keyword
} />
<
span
className = "input-group-btn" >
< SearchBar
onSearchBar = {this.props.onSearchBar
}/>
</
span >
< / div >
)
;
}
})
;

var LoginHistoryTableRow = React.createClass({
    render: function () {
        return (
            < tr >
            < td > {this.props.rowData['id']
    } < / td >
    < td > {this.props.rowData['ucode']
} < / td >
< td > {this.props.rowData['ip']
}</
td >
< td > {this.props.rowData['loginTimeStr']
}</
td >
< / tr >
)
;
}
})
;

var LoginHistoryTable = React.createClass({
    getInitialState: function()
{
    return {
        data: [],
        keyword: '',
        pageNum: 1
    };
}
,
handleKeywordInput: function (keyword) {
    this.setState({
        keyword: keyword,
        pageNum: 1
    })
}
,
handleSearchBar: function () {
    this.loadData();
}
,
handleChangePage: function (pageNum) {
    this.setState({
        keyword: this.state.keyword,
        pageNum: pageNum
    }, function () {
        this.loadData();
    });
}
,
componentDidMount: function () {
    this.loadData();
}
,
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
}
,
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
        pageBox =
    <
        PageBar
        pageData = {pageData}
        onChangePage = {this.handleChangePage
    }
/>
    ;
    this.state.data.data.data.forEach(function (rowData) {
        rows.push( < LoginHistoryTableRow
        rowData = {rowData} / >
        )
    });
}

return (
    < div >
    < div
className = "box-body" >
< SearchArea
keyword = {keywords}
onKeywordInput = {this.handleKeywordInput
}
onSearchBar = {this.handleSearchBar
} />
<
table
id = "js_table"
className = "table table-bordered table-hover" >
< thead >
< tr >
< th > 序号 < / th >
< th > 账号 < / th >
< th > 登录IP < / th >
< th > 登录时间 < / th >
< / tr >
< / thead >
< tbody >
{rows}
< / tbody >
< / table >
< / div >
< div
className = "box-footer clearfix" >
{pageBox}
< / div >
< / div >
)
;
}
})
;


ReactDOM.render(
< LoginHistoryTable
url = '/admin/loginHistory/r/list' / >,
    document.getElementById('container')
)
;