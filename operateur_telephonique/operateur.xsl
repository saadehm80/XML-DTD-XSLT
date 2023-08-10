<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Operateur</title>
            </head>
            <body>
                <xsl:for-each select="/operateur/client">
                    <ul>
                        <li> Nom Client: <xsl:value-of select="@nom"/>    </li>
                        <li>Nombre d'abonnements: <xsl:value-of select="count(abonnement)"/></li>
                        <li>Total Factures d'abonnements: <xsl:value-of select="sum(abonnement/facture/@montant)"/></li>
                    </ul>
                            <table border="1" width="75%">
                                <tr>
                                    <th>Numero</th> <th>Date abonnement</th><th>Type d'abonnement</th><th>Nombre Factures</th><th>Moyen montants Factures</th><th>Total Factures</th>
                                </tr>
                                <xsl:for-each select="abonnement">
                                    <tr>
                                        <td><xsl:value-of select="@numAb"/></td>
                                        <td><xsl:value-of select="@dateAb"/></td>
                                        <td><xsl:value-of select="@type"/></td>
                                        <td><xsl:value-of select="count(facture)"/></td>                                        
                                        <td><xsl:value-of select="avg(facture/@montant)"/></td>
                                        <td><xsl:value-of select="sum(facture/@montant)"/></td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>