<xsl:package 
  name="http://www.w3.org/xslt30tests/override-001"
  package-version="1.0.1"
  version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:p="http://www.w3.org/xslt30tests/override-base-001"
  exclude-result-prefixes="xs p">
  
  <xsl:use-package
    name="http://www.w3.org/xslt30tests/override-base-001"
    package-version="1.0.0">
  
    <xsl:override>
  
      <xsl:function name="p:f" as="xs:string" visibility="public">
        <xsl:param name="in" as="xs:string"/>
        <xsl:param name="count" as="xs:integer"/>
        <xsl:sequence select="'*' || p:f-final($in, $count) || '*'"/>
      </xsl:function>
    
      <xsl:function name="p:f-abstract" as="xs:string" visibility="public">
        <xsl:param name="in" as="xs:string"/>
        <xsl:param name="count" as="xs:integer"/>
        <xsl:sequence select="'abcd'"/>
      </xsl:function>
      
    </xsl:override>  
    
  </xsl:use-package>
  
  
  
    <xsl:variable name="v" select="p:f('x', 5)"/>
   
    <xsl:template name="main" visibility="public">
      <xsl:choose>
        <xsl:when test="$v = '*xxxxx*'"><ok/></xsl:when>
        <xsl:otherwise><wrong value="{$v}"/></xsl:otherwise>
      </xsl:choose>
    </xsl:template>
    
 
  
</xsl:package>   