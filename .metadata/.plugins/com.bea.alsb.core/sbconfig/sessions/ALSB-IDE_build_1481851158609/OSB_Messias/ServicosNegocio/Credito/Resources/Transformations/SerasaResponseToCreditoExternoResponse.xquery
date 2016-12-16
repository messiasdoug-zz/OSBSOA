<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$resultadoSerasa" element="ns1:ResultadoSerasa" location="../Interfaces/Schemas/Serasa.xsd" ::)
(:: pragma bea:global-element-return element="ns2:resultadoVerificaCreditoExterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns2 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://serasa.com.br/SN/Serasa";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Messias";
declare namespace xf = "http://tempuri.org/OSB_Messias/ServicosNegocio/Credito/Resources/Transformations/SerasaResponseToCreditoExternoResponse/";

declare function xf:SerasaResponseToCreditoExternoResponse($resultadoSerasa as element(ns1:ResultadoSerasa))
    as element(ns2:resultadoVerificaCreditoExterno) {
        <ns2:resultadoVerificaCreditoExterno>
            <ns2:credito>
                <ns0:pessoa>
                    <ns0:cnpj>{ data($resultadoSerasa/ns1:num_documento) }</ns0:cnpj>
                </ns0:pessoa>
                <ns0:situacao>{ fn:round($resultadoSerasa/ns1:valor_restricao) }</ns0:situacao>
            </ns2:credito>
        </ns2:resultadoVerificaCreditoExterno>
};

declare variable $resultadoSerasa as element(ns1:ResultadoSerasa) external;

xf:SerasaResponseToCreditoExternoResponse($resultadoSerasa)]]></con:xquery>
    <con:dependency location="../Interfaces/Schemas/Serasa.xsd">
        <con:schema ref="OSB_Messias/ServicosNegocio/Credito/Resources/Interfaces/Schemas/Serasa"/>
    </con:dependency>
    <con:dependency location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd">
        <con:schema ref="OSB_Messias/EBS/Credito/xsd/ParametrosCredito"/>
    </con:dependency>
</con:xqueryEntry>