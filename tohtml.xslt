<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="2.0"
    xmlns:alt="http://id.altlaw.org/terms/"
    xmlns:bibo="http://purl.org/ontology/bibo/"
    xmlns:cc="http://creativecommons.org/ns#"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:vs="http://www.w3.org/2003/06/sw-vocab-status/ns#"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xhv="http://www.w3.org/1999/xhtml/vocab#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">

  <xsl:template match="/">
    <html>
      <head>
        <title>AltLaw.org Vocabulary</title>
        <link rel="stylesheet" href="styles.css"/>
      </head>
      <body>
        <xsl:apply-templates select="//owl:Ontology"/>
        <p>
          <xsl:text>This HTML documentation was generated from the original RDF/XML sources on </xsl:text>
          <xsl:value-of select="fn:current-dateTime()"/>
        </p>
        <hr/>
        <div class="rdfclasses">
          <h2>Classes defined in this vocabulary</h2>
          <xsl:apply-templates select="//rdfs:Class"/>
        </div>
        <hr/>
        <div class="rdfproperties">
          <h2>Properties defined in this vocabulary</h2>
          <xsl:apply-templates select="//rdfs:Property[rdfs:isDefinedBy/@rdf:resource = 'http://id.altlaw.org/terms/']"/>
        </div>
        <hr/>
        <div class="rdfborrowed">
          <h2>Terms borrowed from other vocabularies</h2>
          <xsl:apply-templates select="//(rdfs:Property | rdfs:Class)[rdfs:isDefinedBy/@rdf:resource != 'http://id.altlaw.org/terms/']"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="owl:Ontology">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="dcterms:title">
    <h1>
      <xsl:apply-templates/>
    </h1>
  </xsl:template>

  <xsl:template match="dcterms:description|rdfs:comment">
    <xsl:for-each select="fn:tokenize(text(), '\n\n')">
      <p>
        <xsl:value-of select="."/>
      </p>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="rdfs:Class">
    <div class="rdfclass">
      <h3>
        <xsl:text>Class: </xsl:text>
        <xsl:apply-templates select="rdfs:label"/>
      </h3>
      <xsl:apply-templates select="rdfs:comment|rdfs:isDefinedBy|rdfs:subClassOf|rdfs:subClassOf|rdfs:domain|rdfs:range|owl:sameAs"/>
    </div>
  </xsl:template>
  
  <xsl:template match="rdfs:Property">
    <div class="rdfproperty">
      <h3>
        <xsl:text>Property: </xsl:text>
        <xsl:apply-templates select="rdfs:label"/>
      </h3>
      <xsl:apply-templates select="rdfs:comment|rdfs:isDefinedBy|rdfs:subClassOf|rdfs:subClassOf|rdfs:domain|rdfs:range|owl:sameAs"/>
    </div>
  </xsl:template>

  <xsl:template match="rdfs:isDefinedBy">
    <xsl:if test="@rdf:resource != 'http://id.altlaw.org/terms/'">
      <p>
        <xsl:text>Defined by: </xsl:text>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@rdf:resource"/>
          </xsl:attribute>
          <xsl:value-of select="@rdf:resource"/>
        </a>
      </p>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="rdfs:domain">
    <p>
      <xsl:text>Domain: </xsl:text>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="@rdf:resource"/>
        </xsl:attribute>
        <xsl:value-of select="@rdf:resource"/>
      </a>

    </p>
  </xsl:template>
  
  <xsl:template match="rdfs:range">
    <p>
      <xsl:text>Range: </xsl:text>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="@rdf:resource"/>
        </xsl:attribute>
        <xsl:value-of select="@rdf:resource"/>
      </a>
    </p>
  </xsl:template>

  <xsl:template match="rdfs:subClassOf|rdfs:subPropertyOf">
    <p>
      <xsl:text>Refines: </xsl:text>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="@rdf:resource"/>
        </xsl:attribute>
        <xsl:value-of select="@rdf:resource"/>
      </a>
    </p>
  </xsl:template>
  
  <xsl:template match="owl:sameAs">
    <p>
      <xsl:text>Same as: </xsl:text>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="@rdf:resource"/>
        </xsl:attribute>
        <xsl:value-of select="@rdf:resource"/>
      </a>
    </p>
  </xsl:template>
  
</xsl:stylesheet>
