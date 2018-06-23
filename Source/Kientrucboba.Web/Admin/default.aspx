<%@ Page Language="C#" MasterPageFile="~/Admin/admin_site.Master" AutoEventWireup="true"
    CodeBehind="default.aspx.cs" Inherits="Cb.Web.Admin._default" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ContentPlaceHolderID="contentSite" ID="content" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:PlaceHolder ID="phdContent" runat="server"></asp:PlaceHolder>
</asp:Content>