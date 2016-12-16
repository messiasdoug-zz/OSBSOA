(:: pragma bea:global-element-parameter parameter="$resultadoCreditLegacy" element="ns1:ResultadoCreditLegacy" location="../Interfaces/Schemas/CreditLegacy.xsd" ::)
(:: pragma bea:global-element-return element="ns2:resultadoVerificaCreditoInterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns2 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://creditlegacy.com.br/SN/CreditLegacy";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Messias";
declare namespace xf = "http://tempuri.org/OSB_Messias/ServicosNegocio/Credito/Resources/Transformations/CreditLegacyResponseToCreditoInternoResponse/";

declare function xf:CreditLegacyResponseToCreditoInternoResponse($resultadoCreditLegacy as element(ns1:ResultadoCreditLegacy))
    as element(ns2:resultadoVerificaCreditoInterno) {
        <ns2:resultadoVerificaCreditoInterno>
            <ns2:credito>
                <ns0:pessoa>
                    <ns0:cnpj>{ data($resultadoCreditLegacy/ns1:cpf) }</ns0:cnpj>
                </ns0:pessoa>
            </ns2:credito>
        </ns2:resultadoVerificaCreditoInterno>
};

declare variable $resultadoCreditLegacy as element(ns1:ResultadoCreditLegacy) external;

xf:CreditLegacyResponseToCreditoInternoResponse($resultadoCreditLegacy)
