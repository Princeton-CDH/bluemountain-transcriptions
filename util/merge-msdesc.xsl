<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xd tei"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 3, 2016</xd:p>
            <xd:p><xd:b>Author:</xd:b> cwulfman</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    
    <xd:doc>
        <xd:desc>This is the hard-wired path to the msdesc-bearing documents. Edit this for your own environment.</xd:desc>
    </xd:doc>
    <xsl:variable name="msdesc-base" select="'/Users/cwulfman/Desktop/bmtnaau/issues'"/>
    
    

    <xsl:template match="tei:sourceDesc">
        <sourceDesc>
            <xsl:variable name="path">
                <xsl:value-of
                    select="concat($msdesc-base, substring-after(base-uri(current()), 'issues'))"
                />
            </xsl:variable>
            <xsl:variable name="mydoc" select="document($path)"/>
            
            <xsl:copy-of select="$mydoc//tei:msDesc"/>
            <xsl:apply-templates />
        </sourceDesc>
    </xsl:template>
    
    <xsl:template match="tei:title[@level='a' and child::tei:title[@level='a']]">
       <xsl:apply-templates />
    </xsl:template>
    
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    

</xsl:stylesheet>