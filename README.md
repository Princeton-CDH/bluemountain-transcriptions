# Blue Mountain Transcriptions
This repository contains TEI-encoded transcriptions of the avant-garde magazines digitized by the Blue Mountain Project.

The transcriptions are organized by Blue Mountain Identifier (bmtnid); the registry mapping these identifiers to titles can be found [HERE](https://github.com/pulibrary/BlueMountain/wiki/Registry).

The transcriptions are machine-generated derivatives of METS/ALTO/MODS data produced by docWorks.  The code that generates the derivatives can be found in the Blue Mountain repository.

## Structure of Derivatives
The transcriptions have three major parts:

1. **Descriptive metadata.** Detailed item-level metadata, including the title, creator(s), and major language of each item of editorial content (articles, illustrations). Most of the creators have been authorized against [VIAF](http://viaf.org). The descriptive `relatedItem` elements are linked to full-text descriptions (see below).


2. **Coordinated OCR.** Most issues include a `facsimile` element that contains a translation of the ALTO data for each page generated during docWorks processing. The 
facsimile comprises `surface` elements containing `graphic` elements linking to source page images and `zone` elements for TextBlocks, TextLines, and Strings (individual words).

3. **Structured content.** The `body` of each issue contains a hierarchy of of `div` elements whose content is likewise derived automatically from the ALTO files. Line-breaks are marked and linked to specific portions of the facsimile to enable coordination and highlighting on page images.

## The Pilot Branch
Seven titles were the subject of a pilot project to correct and enhance Blue Mountain's data for an experimental API, Blue Mountain Springs.  The article-level metadata was hand-corrected and structural flaws were repaired.  The source documents were measured and described; when possible, additional publication information was added.


## Licensing
All files in this repository are available for research use.
