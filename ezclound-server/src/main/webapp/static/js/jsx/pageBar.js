var PageItemFirst = React.createClass({
    handleChangePage: function()
{
    if (this.props.data.pageNum != 1) {
        this.props.onChangePage(1);
    }
}
,
render: function () {
    var className = "paginate_button";
    if (this.props.data.pageNum == 1) {
        className = "paginate_button disabled";
    }

    return (
        < li
    className = {className} >
    < a
    onClick = {this.handleChangePage
}
href = 'javascript:void(0)' > {this.props.data.firstText
}</
a >
< / li >
)
;
}
})
;

var PageItemLast = React.createClass({
    handleChangePage: function()
{
    if (this.props.data.pageNum != this.props.data.pageCount) {
        this.props.onChangePage(this.props.data.pageCount);
    }
}
,
render: function () {
    var className = "paginate_button";
    if (this.props.data.pageNum == this.props.data.pageCount) {
        className = "paginate_button disabled";
    }

    return (
        < li
    className = {className} >
    < a
    onClick = {this.handleChangePage
}
href = 'javascript:void(0)' > {this.props.data.lastText
}</
a >
< / li >
)
;
}
})
;

var PageItemBlank = React.createClass({
    render: function () {
        return (
            < li
        className = 'paginate_button' > < a
        href = 'javascript:void(0)' >
        ...<
        /a></
        li >
        )
        ;
    }
});


var PageItem = React.createClass({
    handleChangePage: function()
{
    if (this.props.index != this.props.data.pageNum) {
        this.props.onChangePage(this.props.index);
    }
}
,
render: function () {
    var className = "paginate_button";
    if (this.props.index == this.props.data.pageNum) {
        className = "paginate_button active";
    }

    return (
        < li
    className = {className} >
    < a
    onClick = {this.handleChangePage
}
href = 'javascript:void(0)' > {this.props.index
}</
a >
< / li >
)
;
}
})
;

var PageBar = React.createClass({
    render: function()
{
    var html = [];
    html.push( < PageItemFirst
    data = {this.props.pageData
}
onChangePage = {this.props.onChangePage
} />)
;

if (this.props.pageData.pageNum > this.props.pageData.barSize + 1) {
    html.push( < PageItemBlank / >
)
    ;
}

if (this.props.pageData.pageNum <= this.props.pageData.barSize) {
    if (this.props.pageData.pageCount - this.props.pageData.pageNum > this.props.pageData.barSize) {
        for (var i = 1; i <= this.props.pageData.pageNum + this.props.pageData.barSize; i++) {
            html.push( < PageItem
            index = {i}
            data = {this.props.pageData
        }
        onChangePage = {this.props.onChangePage
    }
/>)
    ;
}
} else
{
    for (var i = 1; i <= this.props.pageData.pageCount; i++) {
        html.push( < PageItem
        index = {i}
        data = {this.props.pageData
    }
    onChangePage = {this.props.onChangePage
}
/>)
;
}
}
} else
{
    if (this.props.pageData.pageCount - this.props.pageData.pageNum > this.props.pageData.barSize) {
        for (var i = this.props.pageData.pageNum - this.props.pageData.barSize; i <= this.props.pageData.pageNum + this.props.pageData.barSize; i++) {
            html.push( < PageItem
            index = {i}
            data = {this.props.pageData
        }
        onChangePage = {this.props.onChangePage
    }
/>)
    ;
}
} else
{
    for (var i = this.props.pageData.pageNum - this.props.pageData.barSize; i <= this.props.pageData.pageCount; i++) {
        html.push( < PageItem
        index = {i}
        data = {this.props.pageData
    }
    onChangePage = {this.props.onChangePage
}
/>)
;
}
}
}

if (this.props.pageData.pageCount - this.props.pageData.pageNum > this.props.pageData.barSize) {
    html.push( < PageItemBlank / >
)
    ;
}

html.push( < PageItemLast
data = {this.props.pageData
}
onChangePage = {this.props.onChangePage
} />)
;
return (
    < div >
    < ul
className = "pagination pagination-sm no-margin pull-right" >
{html}
< / ul >
< span
style = {
{
    display: "inline-block", lineHeight
:
    '28px'
}
}>
共
{
    this.props.pageData.total
}
条, {this.props.pageData.pageCount
}
页 < / span >
< / div >
)
;
}
})
;