<#import "template.ftl" as layout>
<#import "components/atoms/button.ftl" as button>
<#import "components/atoms/button-group.ftl" as buttonGroup>

<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#if messageHeader??>
        ${messageHeader}
        <#else>
        ${message.summary}
        </#if>
    <#elseif section = "form">
    <div id="kc-info-message">
        <p class="instruction">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}<#sep>, </#items></b></#list><#else></#if></p>
        <br/>
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <a href="${pageRedirectUri}"><@button.kw color="primary">${kcSanitize(msg("backToApplication"))?no_esc}</@button.kw></a>
            <#elseif actionUri?has_content>
                <a href="${actionUri}"><@button.kw color="primary">${kcSanitize(msg("proceedWithAction"))?no_esc}</@button.kw></a>
            <#elseif (client.baseUrl)?has_content>
                <a href="${client.baseUrl}"><@button.kw color="primary">${kcSanitize(msg("backToApplication"))?no_esc}</@button.kw></a>
            </#if>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>
