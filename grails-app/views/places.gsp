<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>

    <style>
    .portrait {
        float: right;
    }
    </style>

</head>

<body>

<div class="tabbable">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#1" data-toggle="tab"><g:translatable code="places.allmap.tabheader">Helsingfors by-kort</g:translatable></a></li>
        <li><a href="#2" data-toggle="tab"><g:translatable code="places.church.tabheader">Kirken</g:translatable></a></li>
        <li><a href="#3" data-toggle="tab"><g:translatable code="places.dinner.tabheader">Bryllupsfesten</g:translatable></a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active" id="1">
            <div class="span9">

                <g:translatable code="places.weddingmap">

                    <h1>Bryllups kortet - Her foregår det!</h1>

                    <p>
                        På nedenstående kort kan du få et overblik over den centrale del af Helsingfors med en markinger af de steder,
                        der er vigtige under brylluppet. <br/>
                    </p>
                </g:translatable>
                <iframe width="100%" height="450px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                        src="http://maps.google.dk/maps/ms?msa=0&amp;msid=213169262195527989832.0004ba6b4c5b6a11cf6b7&amp;ie=UTF8&amp;ll=60.162363,24.958821&amp;spn=0.001901,0.014146&amp;t=m&amp;output=embed"></iframe><br/><small>Vis <a
                    href="http://maps.google.dk/maps/ms?msa=0&amp;msid=213169262195527989832.0004ba6b4c5b6a11cf6b7&amp;ie=UTF8&amp;ll=60.162363,24.958821&amp;spn=0.001901,0.014146&amp;t=m&amp;source=embed"
                    style="color:#0000FF;text-align:left">Bryllup</a> på et større kort</small>
            </div>
        </div>

        <div class="tab-pane" id="2">
            <div class="span6">
                <g:translatable code="places.thechurch">
                    <h1>Den Tyske Kirke</h1>

                    <p>
                        Den tyske kirke er valgt fordi den er smuk og ligger i bekvem afstand af festsalen.
                    </p>
                </g:translatable>
            </div>

            <div class="span3">
                <div class="well portrait">
                    <g:img dir="images" file="germanchurch.jpg" width="100%"/>
                    <p>Unionsgatan 1  00130 Helsinki, Finland</p>
                    <g:img dir="images" file="germanchurch_map.jpg" width="100%"/>
                </div>
            </div>
        </div>

        <div class="tab-pane" id="3">
            <div class="span6">
                <g:translatable code="places.theboathouse">
                    <h1>Festen</h1>

                    <p>
                        Selve bryllupsfesten foregår på en lille ø i Helsingfors havn. På øen ligger et lille værft, som er bygget om til gildesal.<br>
                        Selve middagen starter kl 18. Transport sker med offentlig transport, hvor vi har lavet en aftale med selskabet om at vores gæster fragtes frit.<br>

                    </p>
                </g:translatable>
            </div>

            <div class="span3">
                <div class="well portrait">
                    <g:img dir="images" file="Valkosaari2.JPG" width="100%"/>
                </div>
                <div class="well portrait">
                    <g:img dir="images" file="Valkosaari3.JPG" width="100%"/>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
