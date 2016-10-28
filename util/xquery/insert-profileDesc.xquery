declare namespace tei="http://www.tei-c.org/ns/1.0";

let $hits := collection('/db/bmtn-data/transcriptions/periodicals')/tei:TEI/tei:teiHeader[empty(tei:profileDesc)]
for $hit in $hits return 
<hit>
<title>{ $hit//tei:fileDesc//tei:titleStmt//tei:title}</title>
<id>{ $hit//tei:idno }</id>
</hit>

