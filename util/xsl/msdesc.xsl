<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd tei" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>
                <xd:b>Created on:</xd:b> Jun 8, 2015</xd:p>
            <xd:p>
                <xd:b>Author:</xd:b> cwulfman</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:output method="html" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>

                <link href="util/css/bootstrap.min.css" rel="stylesheet"/>

            </head>
            <body>
                <div class="container">
                    <xsl:apply-templates
                        select="tei:TEI/tei:teiHeader[1]/tei:fileDesc[1]/tei:sourceDesc[1]/tei:msDesc[1]"
                    />
                </div>


                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"/>
                <!-- Include all compiled plugins (below), or include individual files as needed -->
                <script src="util/js/bootstrap.min.js"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:msDesc">
        <xsl:apply-templates select="tei:msIdentifier"/>
        <div class="row">
            <h2>Physical Description of the Object</h2>
            <xsl:apply-templates select="tei:physDesc"/>
        </div>
        <div class="row">
            <h2>History of the Object</h2>
            <xsl:apply-templates select="tei:history"/>
        </div>

    </xsl:template>

    <xsl:template match="tei:msIdentifier">
        <dl class="dl-horizontal">
            <dt>holding institution</dt>
            <dd>
                <xsl:apply-templates select="tei:institution"/>
            </dd>
        </dl>
    </xsl:template>

    <xsl:template match="tei:physDesc">
        <div class="col-md-6">

            <xsl:apply-templates select="tei:objectDesc"/>

        </div>
        <div class="col-md-6">

            <xsl:apply-templates select="tei:typeDesc"/>
            <xsl:apply-templates select="tei:additions"/>
            <xsl:apply-templates select="tei:bindingDesc"/>
        </div>
    </xsl:template>

    <xsl:template match="tei:objectDesc">
        <div id="objectDesc">

            <dl class="dl-horizontal">
                <dt>form of object</dt>
                <dd>
                    <xsl:value-of select="@form"/>
                </dd>

                <xsl:apply-templates select="tei:supportDesc"/>
                <xsl:apply-templates select="tei:layoutDesc"/>
            </dl>

        </div>
    </xsl:template>
    <xsl:template match="tei:supportDesc">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="tei:support">
        <dt>paper</dt>
        <dd><xsl:apply-templates/></dd>

      
    </xsl:template>
    <xsl:template match="tei:extent">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:extent/tei:measure">
        <dt>
            <xsl:value-of select="string-join((@unit, @type), ' ')"/>
        </dt>
        <dd>
            <xsl:apply-templates/>
        </dd>
    </xsl:template>

    <xsl:template match="tei:dimensions">
        <xsl:variable name="width">
            <xsl:value-of select="tei:width"/>
        </xsl:variable>
        <xsl:variable name="height">
            <xsl:value-of select="tei:height"/>
        </xsl:variable>

        <dt>width</dt>
        <dd>
            <xsl:value-of select="string-join(($width, @unit), ' ')"/>
        </dd>
        <dt>height</dt>
        <dd>
            <xsl:value-of select="string-join(($height, @unit), ' ')"/>
        </dd>
    </xsl:template>

    <xsl:template match="tei:foliation">

        <dt>foliation</dt>
        <dd>
            <xsl:apply-templates/>
        </dd>

    </xsl:template>
    <xsl:template match="tei:layoutDesc">
        <dt>layout</dt>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:layout">
        <dd>
            <xsl:apply-templates/>
        </dd>
    </xsl:template>

    <xsl:template match="tei:typeDesc">
        <div id="typeDesc">
            <h3>Typography</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:additions">
        <div id="additions">
            <h3>Additions</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:bindingDesc">
        <div id="bindingDesc">
            <h3>Binding</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:history">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:measureGrp[@type = 'salesprice']">
        <ul>
            <xsl:for-each select="tei:measure">
                <li>
                    <xsl:apply-templates select="."/>
                </li>
            </xsl:for-each>

        </ul>
    </xsl:template>

    <xsl:template match="tei:measureGrp/tei:measure">
        <xsl:value-of select="string-join((@quantity, @unit),' ')"/>
    </xsl:template>
    
    <xsl:template match="tei:measure">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="tei:provenance">
        <div id="provenance">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
</xsl:stylesheet>
