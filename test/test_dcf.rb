# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/helper'

class TestDcfParser < Test::Unit::TestCase
  should "not accept spaces in keys" do
    assert_nil Dcf.parse("As df: Value\n")
  end

  should "parse a description file" do
    description = <<EOF
Package: RSQLite
Version: 0.7-1
Title: SQLite interface for R
Author: David A. James
Maintainer: Seth Falcon <seth@userprimary.net>
Description: Database Interface R driver for SQLite. This package
        embeds the SQLite database engine in R and provides an
        interface compliant with the DBI package. The source for the
        SQLite engine (version 3.6.4) is included.
LazyLoad: yes
Depends: R (>= 2.6.0), methods, DBI (>= 0.2-3)
Imports: methods, DBI (>= 0.2-3)
License: LGPL (>= 2)
Collate: zzz.R S4R.R dbObjectId.R SQLite.R SQLiteSupport.R
Packaged: Sat Oct 25 18:54:05 2008; seth
Repository: CRAN
Date/Publication: 2008-10-26 18:29:06
EOF
    sqlite = Dcf.parse(description).first
    assert_equal 14, sqlite.keys.length
    assert_equal "RSQLite", sqlite["Package"]
    assert_equal "2008-10-26 18:29:06", sqlite["Date/Publication"]
    assert_equal "zzz.R S4R.R dbObjectId.R SQLite.R SQLiteSupport.R", sqlite["Collate"]
  end

  should "parse badly formatted description files" do
    description = <<EOF
Package: StatFingerprints
Version: 1.3
Depends:
        rgl,car,MASS,ffmanova,akima,labdsv,RColorBrewer,vegan,tcltk2,tcltk,maptools,sciplot
EOF
    stat = Dcf.parse(description).first
    assert_equal "rgl,car,MASS,ffmanova,akima,labdsv,RColorBrewer,vegan,tcltk2,tcltk,maptools,sciplot", stat["Depends"]
  end

  should "parse a simple entry" do
    parse = Dcf.parse("Attr: Value\n").first
    assert_equal ["Attr"], parse.keys
    assert_equal "Value", parse["Attr"]
  end

  should "ignore trailing whitespace" do
    parse = Dcf.parse("Attr: Value    \n").first
    assert_equal "Value", parse["Attr"]
  end

  should "parse values that contains colons" do
    sample = <<EOF
Package: BCE
Version: 1.3
Title: Bayesian composition estimator: estimating sample (taxonomic)
        composition from biomarker data
Author: Karel Van den Meersche <k.vdmeersche@nioo.knaw.nl>, Karline
        Soetaert <k.soetaert@nioo.knaw.nl>
Maintainer: Karel Van den Meersche <k.vdmeersche@nioo.knaw.nl>
Depends: R (>= 2.01), limSolve
Description: Function to estimates taxonomic compositions from
        biomarker data, using a Bayesian approach.
License: GPL
LazyData: yes
Repository: CRAN
Repository/R-Forge/Project: bce
Repository/R-Forge/Revision: 43
Date/Publication: 2009-06-03 20:45:44
Packaged: 2009-06-03 02:59:04 UTC; rforge
EOF
    parse = Dcf.parse(sample).first
    assert_equal "Bayesian composition estimator: estimating sample (taxonomic) " +
                 "composition from biomarker data", parse["Title"]
  end

  should "parse multiple paragraphs" do
    sample = <<EOF
Package: AIGIS
Version: 1.0
Depends: R (>= 2.5.1), gpclib (>= 1.4)

Package: AIS
Version: 1.0
Depends: R (>= 2.1.0)
Suggests: R2HTML
EOF
    parse = Dcf.parse(sample)
    assert_equal "AIGIS", parse[0]["Package"]
    assert_equal "R (>= 2.5.1), gpclib (>= 1.4)", parse[0]["Depends"]
    assert_equal "AIS", parse[1]["Package"]
  end

  should "parse multiline field values" do
    sample = <<EOF
Package: ADaCGH
Version: 1.3-10
Depends: R (>= 2.2.1), cgh, tilingArray, aCGH, cghMCR, papply, GDD,
        waveslim, cluster, snapCGH, Hmisc
Suggests: Rmpi, GLAD, DNAcopy
EOF
    parse = Dcf.parse(sample).first
    assert_equal "R (>= 2.2.1), cgh, tilingArray, aCGH, cghMCR, papply, GDD, " +
                 "waveslim, cluster, snapCGH, Hmisc",
                 parse["Depends"]
  end

  should "parse file with UTF-8 data" do
    sample = <<EOF
Package: DoE.base
Title: Full factorials, orthogonal arrays and base utilities for DoE
        packages
Version: 0.2
Depends: R(>= 2.7.1)
Date: 2009-05-26
Author: Ulrike Groemping
Maintainer: Ulrike Groemping <groemping@bht-berlin.de>
Description: This package creates full factorial experiments and
        experiments based on orthogonal arrays for (industrial)
        experiments. Additionally, it provides some utility functions
        used also by other DoE packages.
License: GPL (>= 2)
LazyLoad: yes
LazyData: yes
Encoding: latin1
Packaged: Tue May 26 10:40:31 2009; Grömping
Repository: CRAN
Date/Publication: 2009-05-26 09:23:28
EOF
    #assert_not_nil Dcf.parse(sample)
  end
end
