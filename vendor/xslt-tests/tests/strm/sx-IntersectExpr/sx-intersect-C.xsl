<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
    
 
    
    <!-- Streaming intersect operator: two consuming operands -->
    
    <xsl:template name="r-002" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="/BOOKLIST/BOOKS/ITEM/PRICE intersect /BOOKLIST/BOOKS/ITEM/AUTHOR"/>
        </out>
      </xsl:source-document>
    </xsl:template>
  
  <!-- Streaming intersect operator: two consuming operands -->
  
  <xsl:template name="r-003" use-when="$RUN">
    <xsl:source-document streamable="yes" href="../docs/books.xml">
      <out>
        <xsl:copy-of select="/BOOKLIST/BOOKS/ITEM/PRICE intersect /BOOKLIST/BOOKS/ITEM[3]/*"/>
      </out>
    </xsl:source-document>
  </xsl:template>
    
  <!-- Streaming intersect operator: two consuming operands, inspection usage -->
    
    <xsl:template name="r-010" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="count(//PRICE intersect //ITEM[@CAT='P']/*)"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming intersect operator: two consuming operands, absorption usage -->
    
    <xsl:template name="r-011" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="sum((/BOOKLIST/BOOKS//PRICE intersect /BOOKLIST//ITEM/PRICE))"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming intersect operator: two consuming operands, transmission usage -->
    
    <xsl:template name="r-012" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS//AUTHOR intersect /BOOKLIST/BOOKS/ITEM/*)[position() mod 2 = 0]"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming intersect operator: two consuming operands, focus-setting usage -->
    
    <xsl:template name="r-013" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM/WEIGHT[@UNIT='oz'] intersect /BOOKLIST/BOOKS/ITEM[@CAT='P']/*) / (.+1)"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming intersect operator: two consuming operands, focus-controlled usage -->
    
    <xsl:template name="r-014" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="/BOOKLIST/BOOKS/ITEM ! (WEIGHT intersect *[@UNIT='oz'])"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
  <!-- Streaming intersect operator: two consuming operands, focus-setting usage -->
    
    <!--<xsl:template name="r-015" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:for-each select="(/BOOKLIST/BOOKS/ITEM/WEIGHT intersect /BOOKLIST/BOOKS/ITEM/*[@UNIT='oz'])">
            <xsl:value-of select=".+1 || ' '"/>
          </xsl:for-each>  
        </out>
      </xsl:source-document>
    </xsl:template>-->
    
  <!-- Streaming intersect operator: two consuming operands, focus-controlled usage -->
    
    <xsl:template name="r-016" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:for-each select="/BOOKLIST/BOOKS/ITEM[1]">
            <xsl:copy-of select="(WEIGHT intersect *[@UNIT='oz'])"/>
          </xsl:for-each>  
        </out>
      </xsl:source-document>
    </xsl:template>    
    
  <!-- Streaming intersect operator: two consuming operands, focus-setting usage for inspection action -->
    
    <xsl:template name="r-017" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM[position()=1 to 3]/* intersect /BOOKLIST/BOOKS/ITEM[position()=3 to 5]/*) ! name()[contains(., 'E')]"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
  <!-- Streaming intersect operator: two consuming operands, apply-templates usage -->
  
  <!-- Not streamable - the intersect of two striding operands is climbing -->
    
   <!-- <xsl:template name="r-018" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:apply-templates select="(/BOOKLIST/BOOKS/ITEM[1]/* intersect /BOOKLIST/BOOKS/*/AUTHOR)" mode="r-018-mode"/>
        </out>
      </xsl:source-document>
    </xsl:template>-->
    
    <xsl:mode name="r-018-mode" streamable="yes" on-no-match="deep-skip"/>
    <xsl:template match="ITEM/*" mode="r-018-mode"><xsl:value-of select="name() || '~'"/></xsl:template>
    
    <!-- Streaming intersect operator: crawling operands, inspection usage -->
    
    <xsl:template name="r-020" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="count(//PRICE intersect //ITEM/*)"/>
        </out>
      </xsl:source-document>
    </xsl:template> 
    
    <!-- Streaming intersect operator: crawling operands, absorption usage -->
    
    <xsl:template name="r-021" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="count((/BOOKLIST/BOOKS/ITEM[1]//text() intersect /BOOKLIST/BOOKS/ITEM/AUTHOR/text()))"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming intersect operator: crawling operands, transmission usage -->
    
    <xsl:template name="r-022" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(/BOOKLIST/BOOKS/ITEM[position()=1 to 2]//text() intersect /BOOKLIST/BOOKS/ITEM/AUTHOR/text())[position() lt 4]"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming intersect operator: crawling operand, focus-setting usage -->
    
    <xsl:template name="r-023" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(//WEIGHT/text() intersect //*[@UNIT='oz']/text()) ! (.+1)"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!--<!-\- Streaming intersect operator: climbing operand, inspection usage -\->
    
    <xsl:template name="r-030" use-when="true() or $RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(/BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::* intersect /BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*/@*) ! name()"/>
        </out>
      </xsl:source-document>
    </xsl:template>-->
    
    <!-- Streaming intersect operator: climbing operands, inspection usage, removal of duplicates -->
    
  <xsl:template name="r-031" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(/BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::* intersect /BOOKLIST/BOOKS/ITEM[2]/PRICE/ancestor::*) ! name()"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming intersect operator: climbing operands, absorption usage -->
    
    <xsl:template name="r-032" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*/@* intersect /BOOKLIST/BOOKS/ITEM[2]/PRICE/ancestor::*/@*)" separator="|"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming intersect operator: climbing operands, absorption usage -->
    
    <xsl:template name="r-033" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM[position()=1 to 3]/ancestor-or-self::*/@CAT intersect /BOOKLIST/BOOKS/ITEM[position()=2 to 4]/PRICE/ancestor-or-self::*/@CAT)" separator="|"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming intersect operator: climbing operands, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-034" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM/PRICE/ancestor-or-self::*/@CAT intersect /BOOKLIST/BOOKS/ITEM/QUANTITY/ancestor-or-self::*/@CAT)" separator="|"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming intersect operator: climbing operands, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-035" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="(//PRICE/ancestor-or-self::*/@* intersect //QUANTITY/ancestor-or-self::*/@*)" separator="|"/>
        </out>
      </xsl:source-document>
    </xsl:template>  
    
 
    
</xsl:stylesheet>