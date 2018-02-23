@echo off
set path=c:\edw\projects\libwin64;%path%
set CUBE_SPARQL_ENDPOINT=http://virtuoso.digital-agenda-data.eu/sparql
rem set CUBE_SPARQL_ENDPOINT=http://test-virtuoso.digital-agenda-data.eu/sparql
rem set CUBE_SPARQL_ENDPOINT=http://test.digital-agenda-data.eu/d-sparql
rem set CUBE_SPARQL_ENDPOINT=http://localhost:28890/sparql
set CUBE_DATASET_URI=http://semantic.digital-agenda-data.eu/dataset/digital-agenda-scoreboard-key-indicators
rem set CUBE_DATASET_URI=http://ec.europa.eu/eurostat/qb/Dataflow/tps00188/1.0
rem set CUBE_DATASET_URI=http://ec.europa.eu/eurostat/qb/Dataflow/gba_fundmod/1.0
set SPARQL_DEBUG=on
cd src\edw.datacube\edw\datacube
..\..\..\..\bin\py.test --durations=10
rem ..\..\..\..\bin\py.test data\tests\metadata_test.py
rem ..\..\..\..\bin\py.test browser\tests\ajax_test.py
rem ..\..\..\..\bin\py.test browser\tests\export_test.py
rem ..\..\..\..\bin\py.test data\tests\dataset_test.py
rem ..\..\..\..\bin\py.test data\tests\dataset_test.py -k test_get_dimension_option_metadata_list
rem ..\..\..\..\bin\py.test data\tests\dataset_test.py -k test_dataset_dimensions_flat_list
rem ..\..\..\..\bin\py.test data\tests\dataset_test.py -k test_dataset_dimensions_metadata
rem ..\..\..\..\bin\py.test data\tests\dimension_test.py -k test_patch_codelist
rem ..\..\..\..\bin\py.test data\tests\dimension_test.py -k test_get_group_dimensions
rem ..\..\..\..\bin\py.test browser\tests\ajax_test.py -k test_datapoints_cpc_EU28
rem ..\..\..\..\bin\py.test browser\tests\ajax_test.py -k test_datapoints_cpt_EU28
rem ..\..\..\..\bin\py.test data\tests\dataset_test.py -k test_get_dataset_details
rem ..\..\..\..\bin\py.test data\tests\dimension_test.py -k test_dimension_options_sort_bug
rem ..\..\..\..\bin\py.test data\tests\dimension_test.py -k test_dimension_options_in_multiple_groups_filtered
rem ..\..\..\..\bin\py.test data\tests\dimension_test.py
rem ..\..\..\..\bin\py.test data\tests\notations_test.py
rem ..\..\..\..\bin\py.test data\tests\observation_test.py
rem ..\..\..\..\bin\py.test data\tests\metadata_test.py -k test_notations_datapoints_cp
rem ..\..\..\..\bin\py.test -s --durations=10 data\tests\observation_test.py -k test_get_observations_with_notes_multidimension
rem ..\..\..\..\bin\py.test -s --durations=10 data\tests\observation_test.py -k test_get_observations_cp
rem ..\..\..\..\bin\py.test data\tests\dataset_test.py -k test_get_dataset_details
rem ..\..\..\..\bin\py.test data\tests\dataset_test.py -k test_get_dimension_option_metadata_list
rem  <cale fisier teste> -k test_remote_
cd ..\..\..\..
