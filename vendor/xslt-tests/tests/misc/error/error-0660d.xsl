<?xml version="1.0" encoding="UTF-8"?>
<!--It is a static error if a  
                        package contains more than one template with the same name and the same
                        import precedence, unless it
                     also contains a template with the same
                     name and higher import
                     precedence.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:my="http://my.com/"
                version="2.0">

<?error XTSE0660?>



  <xsl:template name="main">
      <out>
        <xsl:apply-templates/>
      </out>
  </xsl:template>
  
  <xsl:template name="main">
      <out>
        <xsl:apply-templates/>
      </out>
  </xsl:template>  
  


  


</xsl:stylesheet>
