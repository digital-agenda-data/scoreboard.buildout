@echo off
set path=c:\edw\projects\libwin64;%path%
set CUBE_SPARQL_ENDPOINT=http://virtuoso.scoreboard.edw.ro/sparql
set CUBE_DATASET_URI=http://semantic.digital-agenda-data.eu/dataset/digital-agenda-scoreboard-key-indicators
cd src\edw.datacube\edw\datacube
..\..\..\..\bin\py.test
rem ..\..\..\..\bin\py.test browser\tests\ajax_test.py
rem  ..\..\..\..\bin\py.test browser\tests\export_test.py
rem ..\..\..\..\bin\py.test data\tests\dimension_test.py -k test_get_available_country_options_for_year
rem ..\..\..\..\bin\py.test data\tests\observation_test.py
rem  <cale fisier teste> -k test_remote_
cd ..\..\..\..
