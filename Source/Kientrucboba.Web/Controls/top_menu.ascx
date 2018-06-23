<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="top_menu.ascx.cs" Inherits="Cb.Web.Controls.top_menu" %>

<!--block_topmenu-->
<%@ Register TagPrefix="dgc" TagName="logo_language" Src="~/Controls/logo_language.ascx" %>

<header id="header" class="header-skin-default">

    <div id="topbar-wrapper">

        <div class="container">
            <div class="row">

                <div class="col-md-10 col-sm-9 col-xs-12">

                    <div class="topbar-left">
                        <ul class="list-inline">
                            <li><span class="topbar-label"><i class="fa  fa-home"></i></span><span class="topbar">
                                <asp:Literal runat="server" ID="ltrAddressValue"></asp:Literal>
                            </span></li>
                            <li><span class="topbar-label"><i class="fa fa-envelope-o"></i></span><span class="topbar">
                                <asp:Literal runat="server" ID="ltrEmail"></asp:Literal></span></li>

                            <li><span class="topbar-label"><i class="fa fa-phone"></i></span><span class="topbar">
                                <asp:Literal runat="server" ID="ltrPhoneValue"></asp:Literal></span></li>
                        </ul>
                    </div>

                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 hidden">
                    <div class="header-left-info">
                        <ul class="list-inline">
                            <li><span class="header-label"><i class="fa fa-phone"></i></span><span class="header-hightlight">
                                <small>
                                    <asp:Literal runat="server" ID="ltrPhoneName"></asp:Literal></small>
                                <strong>
                                    <asp:Literal runat="server" ID="ltrPhoneValue1"></asp:Literal></strong></span>
                            </li>
                            <li class=""><span class="header-label"><i class="fa  fa-clock-o"></i></span><span class="header-hightlight">
                                <small>
                                    <asp:Literal runat="server" ID="ltrWokingTimeName"></asp:Literal>
                                </small>
                                <strong>
                                    <asp:Literal runat="server" ID="ltrWokingTimeValue"></asp:Literal></strong></span></li>
                        </ul>
                    </div>
                    <div class="header-right-info hidden">
                        <a class="header-button" href="/lien-he/vn">Get A Quote</a>
                    </div>
                </div>

                <div class="col-md-2 col-sm-3 hidden-xs">

                    <div class="topbar-right text-right">
                        <div class="st-social pull-left">
                            <ul class="list-inline">
                                <li><a class="fa fa-facebook" href="#" title="Facebook" target="_blank" runat="server" id="hypFBFanpage"></a></li>
                                <li><a class="fa fa-twitter" href="#" title="Twitter" target="_blank" runat="server" id="hypTwitter"></a></li>
                                <li><a class="fa fa-linkedin" href="#" title="LinkedIn" target="_blank" runat="server" id="hypLinkedIn"></a></li>
                            </ul>
                        </div>
                        <dgc:logo_language ID="logo_language" runat="server" />
                    </div>

                </div>

            </div>
        </div>

    </div>
    <div id="header-wrapper" class="header-stick">

        <div class="container">
            <div class="row">

                <div class="col-md-12">

                    <div class="header-container">

                        <div class="header-logo">
                            <a class="st-logo pull-left" runat="server" id="hypIcon">
                                <img class="logo-standart" runat="server" id="imgLogo" />
                            </a>
                            <div class="divNameCorp pull-left">
                                <div class="span1">CÔNG TY TNHH DỊCH VỤ XÂY DỰNG 
                                </div>
                                <div class="span2">THIÊN ÂN PHÁT</div>
                            </div>
                        </div>
                        <a id="toggle-mobile-menu" class="toggle-menu"><span></span></a>

                        <div class="header-right">

                            <div class="header-bottom">
                                <nav id="primary-nav">
                                    <div class="menu-primary-menu-container">
                                        <ul id="primary-menu" class="primary-menu list-inline">

                                            <asp:Repeater runat="server" ID="rptResult" OnItemDataBound="rptResult_ItemDataBound">
                                                <ItemTemplate>
                                                    <li id="menu-item-1835" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-1835">
                                                        <a runat="server" id="hypName">
                                                            <asp:Literal runat="server" ID="ltrName"></asp:Literal>
                                                        </a>
                                                        <ul class="sub-menu" runat="server" id="ulSub">
                                                            <asp:Repeater runat="server" ID="rptResultSub" OnItemDataBound="rptResultSub_ItemDataBound">
                                                                <ItemTemplate>
                                                                    <li id="menu-item-2039" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-2039">
                                                                        <a runat="server" id="hypNameSub2">
                                                                            <asp:Literal runat="server" ID="ltrNameSub2"></asp:Literal></a>

                                                                        <ul class="sub-menu">
                                                                            <asp:Repeater runat="server" ID="rptResultSub1" OnItemDataBound="rptResultSub1_ItemDataBound">
                                                                                <ItemTemplate>
                                                                                    <li id="menu-item-2046" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2046">
                                                                                        <a runat="server" id="hypTitle">
                                                                                            <asp:Literal runat="server" ID="ltrTitle"></asp:Literal></a></li>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                        </ul>

                                                                    </li>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </ul>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </ul>
                                    </div>
                                </nav>
                                <%--    <div class="header-right-inner hidden">
                                    <div class="header-search">
                                        <div class="st-searchform">
                                            <div class="search-form">
                                                <form action="#" method="get">
                                                    <input type="text" name="s" id="s" placeholder="Search..." />
                                                </form>
                                            </div>
                                        </div>
                                        <div class="search-icon"><i class="fa fa-search"></i></div>
                                    </div>
                                </div>--%>
                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>

    </div>

</header>
<asp:HiddenField runat="server" ID="hddParentNameUrl" Visible="false" />

<!--/block_topmenu-->


