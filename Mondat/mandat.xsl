<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Le rapport des Mandats</title>
            </head>
            <body>            
                    <table border="1" width="75%">
                        <tr>
                            <th>Num. mandat</th> <th>Date mandat</th><th>Expediteur</th><th>Destinateur</th><th>Etat</th><th>Montants</th>
                        </tr>
                        
                        <xsl:for-each select="rapport/mandat">
                            <tr>
                                <td><xsl:value-of select="@num"/></td>
                                <td><xsl:value-of select="@date"/></td>
                                <td>
                                    <ul>
                                        <li>Cin: <xsl:value-of select="expediteur/@cin"/></li>   
                                        <li>Nom : <xsl:value-of select="expediteur/@nom"/></li>  
                                    </ul>                                
                                </td>
                                <td>
                                    <ul>
                                        <li>Cin: <xsl:value-of select="destinateur/@cin"/></li>   
                                        <li>Nom : <xsl:value-of select="destinateur/@nom"/></li>  
                                    </ul>                                
                                </td>                                       
                                <td><xsl:value-of select="@etat"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td colspan="5">Total des mandats</td>
                            <td>
                                <xsl:value-of select="sum(rapport/mandant/@montant)"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">Total des mandats recus</td>
                            <td>
                                <xsl:value-of select="sum(rapport/mandant[@etat='RECU']/@montant)"/>
                            </td>
                        </tr>
                    </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>