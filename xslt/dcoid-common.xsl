<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY dco "http://info.deepcarbon.net/schema#">
  <!ENTITY vivo "http://vivoweb.org/ontology/core#">
]>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
		xmlns:dco="&dco;"
		xmlns:vivo="&vivo;"
		xmlns:time="http://www.w3.org/2006/time#"
		xmlns:owl="http://www.w3.org/2002/07/owl#"
		xmlns="http://www.w3.org/1999/xhtml"
>

  <xsl:key name="dco:DcoId-nodes" match="dco:DCOID|*[rdf:type/@rdf:resource='&dco;DCOID']" use="@rdf:about"/>

  <xsl:template name="place-metadata-link">
    <xsl:param name="object"/>
    <xsl:variable name="dcoid" select="key('dco:DcoId-nodes',$object/dco:hasDcoId/@rdf:resource)"/>
    <xsl:variable name="dcoid_url" select="$dcoid/@rdf:about"/>
    <a href="{$dcoid_url}"><xsl:value-of select="$dcoid/rdfs:label"/></a>
  </xsl:template>

</xsl:stylesheet>
