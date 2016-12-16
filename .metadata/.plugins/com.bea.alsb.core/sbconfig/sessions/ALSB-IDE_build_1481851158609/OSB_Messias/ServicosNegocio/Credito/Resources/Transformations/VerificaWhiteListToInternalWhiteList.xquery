<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$parametrosVerificaWhiteList" element="ns1:parametrosVerificaWhiteList" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns2:ParametrosWhiteList" location="../Interfaces/Schemas/InternalWhiteList.xsd" ::)

declare namespace ns2 = "http://whitelist.com.br/SN/WhiteList";
declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Messias";
declare namespace xf = "http://tempuri.org/OSB_Messias/ServicosNegocio/Credito/Resources/Transformations/VerificaWhiteListToWhiteList/";

declare function xf:VerificaWhiteListToWhiteList($parametrosVerificaWhiteList as element(ns1:parametrosVerificaWhiteList))
    as element(ns2:ParametrosWhiteList) {
        <ns2:ParametrosWhiteList>
            <ns2:num_documento>{ data($parametrosVerificaWhiteList/ns1:pessoa/ns0:cnpj) }</ns2:num_documento>
            <ns2:dt_nascimento>{ data($parametrosVerificaWhiteList/ns1:pessoa/ns0:dataNascimento) }</ns2:dt_nascimento>
        </ns2:ParametrosWhiteList>
};

declare variable $parametrosVerificaWhiteList as element(ns1:parametrosVerificaWhiteList) external;

xf:VerificaWhiteListToWhiteList($parametrosVerificaWhiteList)]]></con:xquery>
    <con:dependency location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd">
        <con:schema ref="OSB_Messias/EBS/Credito/xsd/ParametrosCredito"/>
    </con:dependency>
    <con:dependency location="../Interfaces/Schemas/InternalWhiteList.xsd">
        <con:schema ref="OSB_Messias/ServicosNegocio/Credito/Resources/Interfaces/Schemas/InternalWhiteList"/>
    </con:dependency>
</con:xqueryEntry>