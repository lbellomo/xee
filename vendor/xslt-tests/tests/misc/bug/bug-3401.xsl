<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<?spec xslt#copy-of?>
<!-- test nesting depth > 100 -->
<xsl:template match="/"><xsl:copy-of select="."/></xsl:template>
 
</xsl:stylesheet>

