<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: auto-complete-extension.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=auto-complete-extension.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: auto-complete-extension.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=auto-complete-extension.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for auto-complete-extension.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=auto-complete-extension.el" /><meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script src="http://emacswiki.org/emacs/emacs-bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.emacswiki.org/emacs?search=%22auto-complete-extension%5c.el%22">auto-complete-extension.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/auto-complete-extension.el">Download</a></p><pre><span class="comment">;;; auto-complete-extension.el --- Some extension for auto-complete-mode</span>

<span class="comment">;; Filename: auto-complete-extension.el</span>
<span class="comment">;; Description: Some extension for auto-complete-mode</span>
<span class="comment">;; Author: Andy Stewart lazycat.manatee@gmail.com</span>
<span class="comment">;; Maintainer: Andy Stewart lazycat.manatee@gmail.com</span>
<span class="comment">;; Copyright (C) 2008, 2009, Andy Stewart, all rights reserved.</span>
<span class="comment">;; Created: 2008-12-02 11:12:53</span>
<span class="comment">;; Version: 0.1</span>
<span class="comment">;; Last-Updated: 2008-12-02 11:12:56</span>
<span class="comment">;;           By: Andy Stewart</span>
<span class="comment">;; URL: http<span class="builtin">://www</span>.emacswiki.org/emacs/download/auto-complete-extension.el</span>
<span class="comment">;; Keywords: auto-complete</span>
<span class="comment">;; Compatibility: GNU Emacs 23.0.60.1</span>
<span class="comment">;;</span>
<span class="comment">;; Features that might be required by this library<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; `<span class="constant important">auto-complete</span>'</span>
<span class="comment">;;</span>

<span class="comment">;;; This file is NOT part of GNU Emacs</span>

<span class="comment">;;; License</span>
<span class="comment">;;</span>
<span class="comment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="comment">;; it under the terms of the GNU General Public License as published by</span>
<span class="comment">;; the Free Software Foundation; either version 3, or (at your option)</span>
<span class="comment">;; any later version.</span>

<span class="comment">;; This program is distributed in the hope that it will be useful,</span>
<span class="comment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="comment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="comment">;; GNU General Public License for more details.</span>

<span class="comment">;; You should have received a copy of the GNU General Public License</span>
<span class="comment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="comment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="comment">;; Floor, Boston, MA 02110-1301, USA.</span>

<span class="comment">;;; Commentary<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; Some extension for auto-complete-mode.</span>
<span class="comment">;;</span>
<span class="comment">;; Below are commands you can use<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; `<span class="constant important">ac-source-gtags</span>'</span>
<span class="comment">;;      Provide a completion for C or C++.</span>
<span class="comment">;;      You need install `<span class="constant important">gtags</span>' first.</span>
<span class="comment">;;</span>
<span class="comment">;; `<span class="constant important">ac-source-c++</span>'</span>
<span class="comment">;;      Provide a completion keyword for C++.</span>
<span class="comment">;;</span>
<span class="comment">;; `<span class="constant important">ac-source-haskell</span>'</span>
<span class="comment">;;      Provide a completion for Haskell.</span>
<span class="comment">;;      You need install `<span class="constant important">GHC</span>' and `<span class="constant important">hoogle</span>' first.</span>
<span class="comment">;;</span>
<span class="comment">;; About how to use this package, please see<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; http<span class="builtin">://www</span>.emacswiki.org/emacs/download/init-auto-complete.el</span>
<span class="comment">;;</span>

<span class="comment">;;; Installation<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; Put auto-complete-extension.el to your load-path.</span>
<span class="comment">;; The load-path is usually ~/elisp/.</span>
<span class="comment">;; It's set in your ~/.emacs like this<span class="builtin">:</span></span>
<span class="comment">;; (add-to-list 'load-path (expand-file-name <span class="string">"~/elisp"</span>))</span>
<span class="comment">;;</span>
<span class="comment">;; And the following to your ~/.emacs startup file.</span>
<span class="comment">;;</span>
<span class="comment">;; (<span class="keyword">require</span> '<span class="constant">auto-complete-extension</span>)</span>
<span class="comment">;;</span>
<span class="comment">;; No need more.</span>

<span class="comment">;;; Change log<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; 2008/12/02</span>
<span class="comment">;;      First released.</span>
<span class="comment">;;</span>

<span class="comment">;;; Acknowledgements<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;</span>
<span class="comment">;;</span>

<span class="comment">;;; TODO</span>
<span class="comment">;;</span>
<span class="comment">;;</span>
<span class="comment">;;</span>

<span class="comment">;;; Require</span>
(<span class="keyword">require</span> '<span class="constant">auto-complete</span>)

<span class="comment">;;; Code<span class="builtin">:</span></span>

<span class="comment">;; Haskell</span>
(<span class="keyword">defun</span> <span class="function">ac-haskell-hoogle</span> (prefix)
  (<span class="keyword elisp">let</span> (expansion all-expansions end-of-period)
    (<span class="keyword elisp">with-temp-buffer</span>
      <span class="comment">;; Remove period from end of line.</span>
      (<span class="keyword cl">when</span> (string-match <span class="string">"\\(.*\\)\\.$"</span> prefix)
        (setq prefix (match-string 1 prefix))
        (setq end-of-period t))
      <span class="comment">;; Search candidate use `<span class="constant important">hoogle</span>'.</span>
      (call-process  <span class="string">"hoogle"</span> nil t nil <span class="string">""</span> prefix)
      <span class="comment">;; Get match candidate.</span>
      (goto-char (point-min))
      (<span class="keyword elisp">while</span> (re-search-forward
              <span class="string">"^\\(\\(module\\|keyword\\|Prelude\\|Data\\|Language\\.Haskell[<span class="negation">^</span> ]*\\)\\( type\\| class\\)?\\)[ \\.]\\([<span class="negation">^</span> \n]+\\)"</span>
              nil t)
        (setq expansion (match-string 4))
        (setq all-expansions (cons expansion all-expansions)))
      <span class="comment">;; Search class.</span>
      (goto-char (point-min))
      (<span class="keyword elisp">while</span> (re-search-forward
              <span class="string">"^Prelude class .*=&gt; \\([<span class="negation">^</span> \n]+\\)"</span>
              nil t)
        (setq expansion (match-string 1))
        (setq all-expansions (cons expansion all-expansions)))
      <span class="comment">;; Search calss level.</span>
      (goto-char (point-min))
      <span class="comment">;; Add period when option `<span class="constant important">end-of-period</span>'</span>
      <span class="comment">;; is `<span class="constant important">non-nil</span>'.</span>
      (<span class="keyword cl">when</span> end-of-period
        (setq prefix (format <span class="string">"%s."</span> prefix)))
      (<span class="keyword elisp">while</span> (re-search-forward
              (format <span class="string">"^%s[<span class="negation">^</span> \n]+"</span> prefix)
              nil t)
        (setq expansion (match-string 0))
        (setq all-expansions (cons expansion all-expansions))))
    all-expansions))

<span class="comment">;; http<span class="builtin">://www</span>.haskell.org/ghc/docs/latest/html/users_guide/pragmas.html</span>
(<span class="keyword">defconst</span> <span class="variable">ac-haskell-ghc-pragmas</span>
  (sort
   (list <span class="string">"LANGUAGE"</span> <span class="string">"OPTIONS_GHC"</span> <span class="string">"INCLUDE"</span> <span class="string">"WARNING"</span> <span class="string">"DEPRECATED"</span> <span class="string">"INLINE"</span> <span class="string">"NOINLINE"</span>
         <span class="string">"LINE"</span> <span class="string">"RULES"</span> <span class="string">"SPECIALIZE"</span> <span class="string">"UNPACK"</span> <span class="string">"SOURCE"</span>)
   #'(<span class="keyword elisp">lambda</span> (a b) (&gt; (length a) (length b))))
  <span class="string">"GHC pragmas."</span>)

(<span class="keyword">defconst</span> <span class="variable">ac-haskell-defined-punctunation</span>
  (sort
   (list <span class="string">"=="</span> <span class="string">"/="</span> <span class="string">"&lt;="</span> <span class="string">"&gt;="</span> <span class="string">"&gt;&gt;="</span> <span class="string">"&gt;&gt;"</span> <span class="string">"**"</span> <span class="string">"^^"</span>)
   #'(<span class="keyword elisp">lambda</span> (a b) (&gt; (length a) (length b))))
  <span class="string">"Defined punctunation in Haskell."</span>)

(<span class="keyword">defconst</span> <span class="variable">ac-haskell-misc</span>
  (sort
   (list <span class="string">"-fglasgow-exts"</span>)
   #'(<span class="keyword elisp">lambda</span> (a b) (&gt; (length a) (length b))))
  <span class="string">"GHC pragmas."</span>)

(<span class="keyword">defvar</span> <span class="variable">ac-source-haskell</span>
  '((candidates . (<span class="keyword elisp">lambda</span> ()
                    (all-completions ac-target
                                     (append nil
                                             ac-haskell-defined-punctunation
                                             ac-haskell-ghc-pragmas
                                             (ac-haskell-hoogle ac-target)
                                             ac-haskell-misc)))))
  <span class="string">"Sources for Haskell keywords."</span>)

(<span class="keyword">provide</span> '<span class="constant">auto-complete-extension</span>)

<span class="comment">;;; auto-complete-extension.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=auto-complete-extension.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local edit" accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_auto-complete-extension.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=auto-complete-extension.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=auto-complete-extension.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=auto-complete-extension.el">Administration</a></span><span class="time"><br /> Last edited 2013-08-24 12:07 UTC by <a class="author" title="from 178-83-163-103.dynamic.hispeed.ch" href="http://www.emacswiki.org/emacs/AlexSchroeder">AlexSchroeder</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=auto-complete-extension.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search">
<p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
