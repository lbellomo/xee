<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template as="element(a)" name="xsl:initial-template">
        <xsl:result-document href="http://www.example.com/out.xml">
            <out>479</out>
        </xsl:result-document>
        <a>892</a>
    </xsl:template>
</xsl:stylesheet>