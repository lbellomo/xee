<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" version="2.0">

    <xsl:template name="main">
        <out>
            <xsl:analyze-string select="'1949'"
                regex="([0-9]{{1,2}})?\s?([A-Z]{{1}}[a-z]{{1,8}}\.?)?\s?([0-9]{{4}})" flags="">
                <xsl:matching-substring>
                    <one>
                        <xsl:value-of select="regex-group(1)"/>
                    </one>
                    <two>
                        <xsl:value-of select="regex-group(2)"/>
                    </two>
                    <three>
                        <xsl:value-of select="regex-group(3)"/>
                    </three>
                </xsl:matching-substring>
            </xsl:analyze-string>
        </out>
    </xsl:template>

</xsl:stylesheet>
