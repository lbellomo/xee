<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <!-- PURPOSE: Test "treat as" failure on simple values. -->
  <?spec xpath#errors?><?error XPDY0050?>
  
<xsl:param name="p" select="0"/>

  <xsl:template match="/">
    <out>;
     
      <!-- here are some that aren't known until run-time -->
      <t><xsl:value-of select="(if ($p=1) then 's' else 23) treat as xs:decimal "/></t>
      <f><xsl:value-of select="(if ($p=0) then 's' else 23) treat as xs:decimal "/></f>      
    </out> 
  </xsl:template>

</xsl:stylesheet>