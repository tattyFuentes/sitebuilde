<?php
/**
 * $Id: settings.inc.php 407 2007-04-06 18:31:52Z hpfn $
 *
 * Author     : courou&#64;users.sourceforge.net
 * Website    : http://allreponse.ath.cx
 *
 * Support    : http://sourceforge.net/projects/myphpmoney/
 * SVN        : http://myphpmoney.svn.sourceforge.net/viewvc/myphpmoney/
 */

 # --------------------------------------- INITIALISATION -----------------------------------------

   ob_start("ob_gzhandler");                                         ## OPEN THE BUFFER
   ob_implicit_flush(0);                                             ## SEND DATA
   clearstatcache();                                                 ## CLEAR CACHE FILE
   ini_set('magic_quotes_runtime',  0);                              ## PHP.INI
//   ini_set('magic_quotes_gpc',      1);                              ## PHP.INI
//   ini_set('magic_quotes_sybase',   1);                              ## PHP.INI

 # ----------------------------------------- CONNEXION --------------------------------------------

   $_MPM = array();
   $_MPM['Host']               = 'localhost';                        ## Host
   $_MPM['User']               = 'root';                             ## Login
   $_MPM['Password']           = '';                                 ## Password
   $_MPM['Database']           = 'MPM';                              ## Database

 # ----------------------------------- THE PATH FOR APPLICATION -----------------------------------

   if (defined('__DOC__') && __DOC__ == 'YES') define('__NIV__','..'); else define('__NIV__','.');

 # ----------------------------------------- MYPHPMONEY  ------------------------------------------

   $_MPM['version']            = '2.0';                      ## Version of the Application
   $_MPM['file_lang']          = 'english.inc.php';                  ## Your default language (Not obligatory)
   $_MPM['name']               = 'MyPhpMoney';                       ## Name of the Application and cookies
   $_MPM['magic']              = 'mpm--Not--Equal--MPM';             ## A string to randomize the session
   $_MPM['sess_expire']        = 1200;                               ## Time for the session Logout (20 minutes)

 # ------------------------------------------ REPERTORY  -----------------------------------------

   $_PHPLIB = array();
   $_PHPLIB['libdir']          = __NIV__.'/../phplib/';              ## Directory PHPLIB
   $_MPM['dir_change']         = __NIV__.'/../CHANGES/';             ## Changelog directory
   $_MPM['dir_template']       = __NIV__.'/templates/';              ## Template directory
   $_MPM['dir_faq']            = __NIV__.'/../FAQ/';                 ## FAQ directory
   $_MPM['dir_image']          = __NIV__.'/images/';                 ## Image directory
   $_MPM['dir_tables']         = __NIV__.'/tables/';                 ## Table directory
   $_MPM['dir_config']         = __NIV__.'/config/';                 ## Configurate directory
   $_MPM['dir_class']          = __NIV__.'/class/';                  ## Class directory
   $_MPM['dir_graph']          = __NIV__.'/graph/';                  ## Image directory
   $_MPM['dir_style']          = __NIV__.'/style/';                  ## Configurate directory
   $_MPM['dir_lang']           = __NIV__.'/lang/';                   ## Lang directory
   $_MPM['dir_doc']            = __NIV__.'/doc/';                    ## Configurate directory
   $_MPM['dir_function']       = __NIV__.'/inc/';                    ## Function directory
   $_MPM['dir_dump']           = 'dump/';                            ## Dump directory
   $_MPM['dir_font']           = 'fonts/';                           ## Font directory

 # ------------------------------------- FILE OF APPLICATION --------------------------------------

   $_MPM['file_credit']        = __NIV__.'/../CREDITS';              ## Credit file
   $_MPM['file_licence']       = __NIV__.'/../LICENCE';              ## Licence file
   $_MPM['file_install']       = __NIV__.'/../INSTALL';              ## Install file
   $_MPM['file_readme']        = __NIV__.'/../README';               ## Readme file
   $_MPM['file_set']           = 'settings.inc.php';                 ## File for the Settings
   $_MPM['file_calculate']     = 'calculate.php';                    ## calculate file
   $_MPM['file_camenbert']     = 'camembert.php';                    ## graph (simulate camenbert)
   $_MPM['file_stylphp']       = 'dynamique.php';                    ## Dynamique Javascript for (php and Javascript)
   $_MPM['file_listing']       = 'listing.php';                      ## listing file
   $_MPM['file_account']       = 'account.php';                      ## account file
   $_MPM['file_listop']        = 'listop.php';                       ## list for operate
   $_MPM['file_newop']         = 'newop.php';                        ## add the new operate
   $_MPM['file_all']           = 'general.php';                      ## graph (home graphique)
   $_MPM['file_faq_default']   = 'FAQ_README';                       ## Default file for FAQ
   $_MPM['file_phpdoc']        = 'phpdoc.php';                       ## Display the phpdoc
   $_MPM['file_css']           = 'common.css';                       ## Style css for global application
   $_MPM['file_common']        = 'common.js';                        ## Common Javascript
   $_MPM['file_excel_c']       = 'chart.php';                        ## excel chart file
   $_MPM['file_login']         = 'login.php';                        ## login file
   $_MPM['file_excel_d']       = 'dump.php';                         ## excel data file
   $_MPM['file_stylang']       = 'lang.php';                         ## Dynamique Javascript for language
   $_MPM['file_md5']           = 'md5.js';                           ## md5 Javascript
   $_MPM['file_faq_lang']      = 'FAQ_';                             ## Lang file for FAQ
   $_MPM['class_phpquote']     = 'phpquote.class';                   ## Phpquote
   $_MPM['class_portfolio']    = 'portfolio.class';                  ## Portfolio
   $_MPM['class_phpdoc']       = 'phpdoc.class';                     ## Phpdoc
   $_MPM['class_graph']        = 'graph.class';                      ## Graph

 # ------------------ BECAREFUL IF CHANGE MODIFIED TOO 'IMG_ALT' - 'IMG_ALT_NAV' ------------------

   $_MPM['http']               = array();
   $_MPM['http'][0]            = 'index.php';                        ## For display the home
   $_MPM['http'][1]            = 'book.php';                         ## For display the good book
   $_MPM['http'][2]            = 'calendar.php';                     ## For display calendar
   $_MPM['http'][3]            = 'operate.php';                      ## For display the third and part
   $_MPM['http'][4]            = 'simulate.php';                     ## For display the simulate
   $_MPM['http'][5]            = 'save.php';                         ## For display the save
   $_MPM['http'][6]            = 'doc/index.php';                    ## For display the documentation
   $_MPM['http'][7]            = 'option.php';                       ## For display the option and config
   $_MPM['http'][8]            = 'login.php?op=Signup';              ## For the form (logging)
   $_MPM['http'][9]            = 'login.php?op=Logout';              ## For the loggout
   $_MPM['http'][10]           = 'portfolio.php';                    ## For the quote
   $_MPM['http'][11]           = 'balance.php';                      ## For the balance (bilan)

 # ------------------------------------ NAME OF ALL IMAGE FILE ------------------------------------

   $_MPM['img_concept']        = 'concept.gif';                      ## Image concept
   $_MPM['img_grabs_1']        = 'screen1.gif';                      ## Image for display the screen grab
   $_MPM['img_grabs_2']        = 'screen2.gif';                      ## Image for display the screen grab
   $_MPM['img_grabs_3']        = 'screen3.gif';                      ## Image for display the screen grab
   $_MPM['img_grabs_4']        = 'screen4.gif';                      ## Image for display the screen grab
   $_MPM['img_grabs_5']        = 'screen5.gif';                      ## Image for display the screen grab
   $_MPM['img_grabs_6']        = 'screen6.gif';                      ## Image for display the screen grab
   $_MPM['img_grabs_7']        = 'screen7.gif';                      ## Image for display the screen grab
   $_MPM['img_grabs_8']        = 'screen8.gif';                      ## Image for display the screen grab
   $_MPM['img_grabs_9']        = 'screen9.gif';                      ## Image for display the screen grab
   $_MPM['img_logo']           = 'logo.jpg';                         ## Image for logo
   $_MPM['img_menu']           = 'logo.gif';                         ## Image for the menu (print...)
   $_MPM['img_mouse']          = 'cursor.ani';                       ## Image mouse
   $_MPM['help_reduit']        = "help_reduit.png";                  ## Image for help window
   $_MPM['help_open']          = "help_open.png";                    ## Image for help window
   $_MPM['help_close']         = "help_close.png";                   ## Image for help window

 # ---------------------------- XML FILE FOR THE TAUX MONETAIRE -----------------------------------

   $_MPM['export_local']       = __NIV__.'/export/local.xml';        ## Local file for XML
   $_MPM['export_original']    = __NIV__.'/export/original.xml';     ## Local file for XML (original)
   $_MPM['cac40']              = __NIV__.'/export/cac40.txt';        ## Something symbol for bourse

 # ----------------------------- NAME NO TRANSLATE OF APPLICATION ---------------------------------

   $_MPM['translate_acces']    = 'Use Encryption';                   ## Message for md5 encrypt
   $_MPM['translate_phpdoc']   = 'Phpdoc';                           ## PhpDoc name
   $_MPM['translate_mail']     = 'Mailing List';                     ## Mailing List
   $_MPM['translate_email']    = 'myphpmoney-list&#64;users.sourceforge.net?subject=subscribe';## Mailing List

 # ------------------------------- HEADER INFORMATION (METAG - TAG) -------------------------------

   $_MPM['header_PRAGMA']      = 'no-cache';                         ## HTTP/1.0
   $_MPM['header_AUTHOR']      = 'Courou';                           ## Author
   $_MPM['header_DUMP_WEB']    = 'http://allreponse.ath.cx';         ## Url allreponse
   $_MPM['header_MAIL']        = 'courou&#64;users.sourceforge.net'; ## Email author
   $_MPM['header_ROBOTS']      = 'None';                             ## no for robot (application)
   $_MPM['header_ROBOTS_D']    = 'index| all | follow';             ## yes for robot (documentation)
   $_MPM['header_COPYLEFT']    = "Copyright &copy; 2001 - %s";       ## Copyleft
   $_MPM['header_VERSION']     = 'Release Version';                  ## Version name
   $_MPM['header_CACHE']       = 'no-cache,no-store,pre-check=0,post-check=0,proxy-revalidate,must-revalidate,max-age=0,s-maxage=0'; ## HTTP/1.1

 # ---------------------- NAME OF TABLE (MUST HAVE A SEPARATOR '_') -------------------------------

   $_MPM['table_php']          = 'table.php';                        ## Create the table (file php)
   $_MPM['table_lib']          = 'phplib.php';                       ## Create the table (phplib)
   $_MPM['table_phplib']       = 'active_sessions';                  ## storage the session (PHPLIB name)

   $_MPM['table']              = array();
   $_MPM['table'][0]           = 'MPM_part';                         ## storage the part
   $_MPM['table'][1]           = 'MPM_op';                           ## storage the operation
   $_MPM['table'][2]           = 'MPM_acct';                         ## storage the account
   $_MPM['table'][3]           = 'MPM_user';                         ## storage the user information
   $_MPM['table'][4]           = 'MPM_third';                        ## storage the third
   $_MPM['table'][5]           = 'MPM_portfolio';                    ## storage the personnal quotes
   $_MPM['table'][6]           = 'MPM_order';                        ## storage de ASC DESC choice
   $_MPM['table'][7]           = 'MPM_quotes';                       ## storage the quotes

 # ------------------------------------------- DATE FORMAT ----------------------------------------

   $_MPM['date_expire']        = date('D, d M Y H:i:s');             ## Expire for the header
   $_MPM['date_dump']          = date('j F Y à h:i s');              ## For the dump sql
   $_MPM['date_modif']         = date('d/m/Y à H:i:s',getlastmod()); ## Last modif for the documentation
   $_MPM['date_sql']           = date('Y-m-d H:i:s');                ## For insert SQL date
   $_MPM['date_days']          = date('w-d-m-Y');                    ## For display the complet date
   $_MPM['date_gettime']       = getdate(time());                    ## Current date
   $_MPM['date_unix']          = date('U');                          ## Unix Time for the session

 # ------------------------------- BODY TAG HTML FOR THE JS ACTION  -------------------------------

   $_MPM['body_js']            = 'GroupStart();';                                      ## NAME FUNCTION FOR LAYER HELP MOUVE HIDDEN SHOW
   $_MPM['body_LAYER']         = ' onload="%s"';                                       ## FOR MOUV AND DISPLAY THE HELP
   $_MPM['body_SCROLLING_B']   = ' onload="AnchorForm();%s"';                          ## IF NECESSARY SCROLLING BELOW (OPERA)
   $_MPM['body_SCROLLING_T']   = ' onload="AnchorForm2();%s"';                         ## IF NECESSARY SCROLLING TOP (OPERA)
   $_MPM['body_SIMPLE']        = ' onload="window.focus();%s"';                        ## IF SIMULATE FILE
   $_MPM['body_DOUBLE']        = ' onload="BodyDouble();" onunload="ClosePopup();"';   ## IF SIMULATE HAVE EFFECTED
   $_MPM['body_FOCUS']         = ' onload="BodyFocus();"';                             ## IF CALCULATE FILE
   $_MPM['body_POPULATE_B']    = ' onload="BeforePopulate();AnchorForm();"';           ## IF ACCOUNT FILE (MODE MODIF - BELOW)
   $_MPM['body_POPULATE_T']    = ' onload="BeforePopulate();AnchorForm2();"';          ## IF ACCOUNT FILE (MODE MODIF - TOP)
   $_MPM['body_NOTHING']       = '';                                                   ## NO OPTION IN THE BODY

 # ------------------------------------- EXTERNAL URL (SOURCEFORGE) -------------------------------

   $_MPM['sf']                 = 'http://sourceforge.net/';                            ## Url Sourceforge
   $_MPM['sf-cgi']             = 'http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/';    ## Url Sourceforge
   $_MPM['sf-bugs']            = 'func=add&amp;group_id=46190&amp;atid=445350';        ## bugs parameter

   $_MPM['external_contrib']   = 'http://www.myphpmoney.net/lang.php';                 ## Url for lang contribute
   $_MPM['external_faq']       = $_MPM['sf-cgi'].'myphpmoney/myphpmoney-phplib/FAQ';   ## Url for the FAQ
   $_MPM['external_cvs']       = $_MPM['sf-cgi'].'myphpmoney/myphpmoney-phplib';       ## Url for the Souce CVS
   $_MPM['external_down']      = $_MPM['sf'].'project/showfiles.php?group_id=46190';   ## Url for the Download
   $_MPM['external_forum']     = $_MPM['sf'].'forum/forum.php?forum_id=151323';        ## Url for the Forum
   $_MPM['external_support']   = $_MPM['sf'].'projects/myphpmoney/';                   ## Url for the Project Support
   $_MPM['external_bugs']      = $_MPM['sf'].'tracker/?'.$_MPM['sf-bugs'];             ## Url for the Bugs

   $_MPM['my']                 = 'http://myphpmoney.ath.cx/UPDATE_MYPHPMONEY/UPDATE/'; ## Url Site for update
   $_MPM['external_rate']      = $_MPM['my'].'EXPORT/remote.xml';                      ## Url for the remote file Rate
   $_MPM['external_lang']      = $_MPM['my'].'LANGUAGE/';                              ## Url for the remote file add lang
   $_MPM['external_check']     = $_MPM['my'].'VERSION/version.txt';                    ## Url for check new applcation

   $_MPM['external_xhtml']     = "http://validator.w3.org/check?uri=%s";               ## Url for the xhtml validator
   $_MPM['external_css']       = "http://jigsaw.w3.org/css-validator/validator?uri=%s";## Url for the css validator

   $_MPM['external_mess']      = '<form action="'.$_MPM['external_bugs'].'" method="post"><div class="centered">';
   $_MPM['external_mess']     .= '<input type="submit" value="SEND BUG REPORT" onclick="window.open(\''.$_MPM['external_bugs'].'\',\'_blank\',\'width=800,height=600\');return false;" />';
   $_MPM['external_mess']     .= '</div></form><div class="centerhr"><br /><div class="blockhr2"><hr /></div><br /></div>';

 # ------------------------------------- COUNTRY ZONE EURO  ---------------------------------------

   ## In the order : Allemagne - Autriche - Belgique - Espagne - Finlande - France - Grèce
   ##                Irlande - Italie - Luxembourg - Pays-Bas - Portugal
   $_MPM['zone_euro']          = array(5,16,22,63,73,74,82,110,113,130,166,173);

 # --------------------------------------- INCLUDE ALL FILE ---------------------------------------

   ## INCLUDE VARIABLE
   require_once $_MPM['dir_config'].'vars.inc.php';

   ## INCLUDE CLASS PHPLIB
   require_once $_PHPLIB['libdir'].'db_mysql.inc.php';                 ## Database
   require_once $_PHPLIB['libdir'].'ct_sql.inc.php';               ## Data storage container
   require_once $_PHPLIB['libdir'].'session4.inc.php';                  ## Session
   require_once $_PHPLIB['libdir'].'page4.inc.php';                     ## Functions
   require_once $_PHPLIB['libdir'].'template.inc.php';                 ## Templates

   ## INCLUDE CLASS MYPHPMONEY
   require_once $_MPM['dir_class'].'calendar.class';               ## Calendar
   require_once $_MPM['dir_class'].'debug.class';                  ## Debug
   require_once $_MPM['dir_class'].'language.class';               ## Language
   require_once $_MPM['dir_class'].'tools.class';                  ## Tools
   require_once $_MPM['dir_class'].'extends.class';                ## All extends

   ## INSTANCE CLASS
   $debugs    = new MPM_Debug;                                     ## DEBUG CLASS
   $langs     = new MPM_Languages;                                 ## LANGUAGE CLASS
   $tools     = new Tools;                                         ## TOOL CLASS
   $db        = new MPM_DB;                                        ## INSTANCE THE CONNECTION
   $other_db  = new MPM_DB;                                        ## INSTANCE THE CONNECTION
   $valid_db  = new MPM_DB;                                        ## INSTANCE THE CONNECTION
   $tpl       = new MPM_Template;                                  ## INSTANCE THE TEMPLATE

   ## INCLUDE ALL FUNCTION
   require_once $_MPM['dir_function'].'function.inc';              ## General function
   require_once $_MPM['dir_function'].'pictures.inc';              ## Display all pictures
   require_once $_MPM['dir_function'].'sql.inc';                   ## Sql function
   require_once $_MPM['dir_function'].'xhtml.inc';                 ## Xhtml function

   ## FOR THE PERSONAL FUNCTION ERROR PHP - (DON'T TOUCH)
   if (!stristr(__DEBUG__,'OFF')) set_error_handler('ErrorHandler');

   ## OPEN THE SESSION
   page_open(array('sess'=>'MPM_Session'));

   ## INCLUDE SETUP
   require_once $_MPM['dir_config'].'setup.inc.php';
