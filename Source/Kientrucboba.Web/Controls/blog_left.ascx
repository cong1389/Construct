<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="blog_left.ascx.cs" Inherits="Cb.Web.Controls.blog_left" %>

<!--blog_left-->
<%@ Register TagPrefix="dgc" TagName="block_like" Src="~/Controls/block_like.ascx" %>

<div class="widget">
    <div class="subtitle-wrap">
        <h4 class="subtitle text-uppercase">
            <asp:Literal runat="server" ID="ltrSearch"></asp:Literal></h4>
    </div>
    <form role="search" action="" method="get">

        <div>
            <input id='Search' name='search' type="text" placeholder="Enter Keywords..." class="search-side live-search" autocomplete="off" onkeypress="return checkEnter(event)">
            <button type='submit' id='btnSubmit' class='search btn btn-default btn-info hidden' onclick="return submitButtonSearchThemes(event)">
                <asp:Literal runat="server" ID="ltrContinus"></asp:Literal></button>
        </div>
    </form>
</div>
<div class="widget">
    <div id="categories-2" class="widget widget_categories">
        <div class="subtitle-wrap">
            <h4 class="subtitle text-uppercase">
                <asp:Literal runat="server" ID="ltrCategory"></asp:Literal></h4>
        </div>

        <ul>
            <asp:Repeater runat="server" ID="rptCategory" OnItemDataBound="rptCategory_ItemDataBound">
                <ItemTemplate>
                    <li class="cat-item cat-item-69"><a runat="server" id="hypTitle">
                        <asp:Literal runat="server" ID="ltrTitle"></asp:Literal></a>
                    </li>
                </ItemTemplate>
            </asp:Repeater>

        </ul>
    </div>
</div>

<div class="widget">
    <div class="subtitle-wrap">
        <h4 class="subtitle text-uppercase">
            <asp:Literal runat="server" ID="ltrSocial"></asp:Literal></h4>
    </div>

    <div class="socialfollow">
        <dgc:block_like ID="block_like" runat="server" />
    </div>
</div>

<script>

    //Search Themes
    function submitButtonSearchThemes(task) {
        var txtSearch = jQuery(".searchTemplate").val();
        var langId = '<%=LangId %>';
        if (txtSearch != "") {
            window.location = langId == "vn" ? GetLink3Param('tim-kiem', langId, RemoveUnicode(txtSearch)) : GetLink3Param('search', langId, RemoveUnicode(txtSearch));
        }
        return false;
    }
</script>
