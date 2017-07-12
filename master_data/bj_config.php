<?php

/*  ----------------------------------------------------------------------------------
AQUA Framework customed cake.1.2
(C)BANEXJAPAN 2006-2009 All Rights Reserved. http://banex.jp
--------------------------------------------------------------------------------------  */

// ----------------------------------------------------------------------------------
// 共通関数をセットする為に、または、汎用的な変数をセットする為に最初に呼び出し
// ----------------------------------------------------------------------------------
//

/**
* フレームワーク外で呼び出された時、CAKEで提供するdefineを用意する
*/

if(!defined("ROOT")){

		define("ROOT", dirname(__FILE__));
}
if (!defined('DS')) {

		define('DS', '/');
//		define('DS', DIRECTORY_SEPARATOR);
}

/**
 * functionディレクトリ
 */
define("FUNCTION_DIR", dirname(ROOT). DS . "function" . DS);

// functionディレクトリにあるファイルは自動的にロードされます
foreach (glob(FUNCTION_DIR."*.php") as $k=>$v){
	require_once($v);
}

// ----------------------------------------------------------------------------------
// プロジェクト毎の設定
// ----------------------------------------------------------------------------------

$hostmap["dev"]  ="mstep-master.sandbox-spc.net";
$hostmap["web"]  ="mstep-master.localhost";
$hostmap["local"]="mstep-master.localhost";

define("DEVELOP_MODE",getDevelopMode());

/*
* データベースの設定
* もしlocal開発を行っていない場合、hogea開発を行っていない場合は、片方を除去してしまっても構いません
* functionServer.php上の、getServerType()でハンドリングされます
*/

#■local
$mysqls["local"]["default"]["host"]="127.0.0.1";
$mysqls["local"]["default"]["login"]="root";
$mysqls["local"]["default"]["password"]="";
$mysqls["local"]["default"]["database"]="spc_mstep_master";
$mysqls["local"]["default"]["unix_socket"]="";
$mysqls["local"]["default"]["password_file"]='';//dirname(__FILE__).DS."mysql_local.cnf";

#■Staging
$mysqls["dev"]["default"]["host"]="localhost";
$mysqls["dev"]["default"]["login"]="root";
$mysqls["dev"]["default"]["password"]="kaido1651";
$mysqls["dev"]["default"]["database"]="spc_mstep_master";
$mysqls["dev"]["default"]["unix_socket"]="";
$mysqls["dev"]["default"]["password_file"]=dirname(__FILE__).DS."mysql_dev.cnf";

#■本番
$mysqls["web"]["default"]["host"]="";
$mysqls["web"]["default"]["login"]="";
$mysqls["web"]["default"]["password"]="";
$mysqls["web"]["default"]["database"]="";
$mysqls["web"]["default"]["unix_socket"]="";
$mysqls["web"]["default"]["password_file"]=dirname(__FILE__).DS."mysql_web.cnf";

define("SITE_TITLE","メガステップ");
define("DOMAIN",$hostmap[DEVELOP_MODE]);
define("ROOT_DOMAIN","http://".DOMAIN);
define("WEB_BASE_URL",ROOT_DOMAIN);
define("ASSETS_URL",WEB_BASE_URL.DS."assets".DS);
define("WEATHER_IMG_DIR",ASSETS_URL."img".DS."weather".DS);

/**
 * MASTER_DATA
 */
define("MASTER_DATA", dirname(ROOT).DS."master_data".DS);
define("TSV", MASTER_DATA."tsv" . DS);
define("SQL", MASTER_DATA."sql" . DS);

// API Version
define("API_CURRENT_VERSION",1);

// domain mstep
define("DOMAIN_NAME_MSTEP", "mstep.com");

// Define constant Master database config
define("MYSQL_DEFAULT_LOGIN",$mysqls[DEVELOP_MODE]["default"]["login"]);
define("MYSQL_DEFAULT_PASS" ,$mysqls[DEVELOP_MODE]["default"]["password"]);
define("MYSQL_DEFAULT_HOST" ,$mysqls[DEVELOP_MODE]["default"]["host"]);
define("MYSQL_DEFAULT_DB"   ,$mysqls[DEVELOP_MODE]["default"]["database"]);
define("MYSQL_DEFAULT_UNIXSOCKET",$mysqls[DEVELOP_MODE]["default"]["unix_socket"]);
# End of client database connection

define("GOOGLE_API_KEY","AIzaSyANHl8-nxwdHyv3FWD6YBEWXEAGLkNwse0");

// edit limited time.
define("EDIT_EFFECTIVE_SECOND",300);
define("REMARKS_SCHEDULE_MAX_LENGTH",10);
define("TIME_KEY","EDIT_LOG");
define("SCHEDULE_BLOCK_NUM",50);

class DATABASE_CONFIG {

		var $default = array(
		
				'datasource' => 'Database/Mysql',		
				'driver' => 'mysql',
				'persistent' => false,
				'host' => MYSQL_DEFAULT_HOST,
				'login' => MYSQL_DEFAULT_LOGIN,
				'password' => MYSQL_DEFAULT_PASS,
				'database' => MYSQL_DEFAULT_DB,
				'encoding' => 'utf8',
				'unix_socket' => MYSQL_DEFAULT_UNIXSOCKET
		);
}

/**
 * E-mail configuration
 *
 * Override E-mail configuration
 * @author Edward <duc.nguyen@spc-vn.com>
 * @date 2016-12-21
 */

#Local
$email['local']['host'] = '';
$email['local']['port'] = 465;
$email['local']['username']='';
$email['local']['password']='';
$email['local']['from']='no-reply@spc-vn.com';
$email['local']['transport']='mail';
$email['local']['encryption']='ssl';
$email['local']['auth_mode']='login';
$email['local']['timeout']=1000;
$email['local']['charset_iso_2022_jp']=false;

#Staging
$email['dev']['host'] = '';
$email['dev']['port'] = 465;
$email['dev']['username']='';
$email['dev']['password']='';
$email['dev']['from']='demo@gmail.com';
$email['dev']['transport']='mail';
$email['dev']['encryption']='ssl';
$email['dev']['auth_mode']='login';
$email['dev']['timeout']=1000;
$email['dev']['charset_iso_2022_jp']=false;

#Production
$email['web']['host'] = '';
$email['web']['port'] = 465;
$email['web']['username']='';
$email['web']['password']='';
$email['web']['from']='demo@gmail.com';
$email['web']['transport']='mail';
$email['web']['encryption']='ssl';
$email['web']['auth_mode']='login';
$email['web']['timeout']=1000;
$email['web']['charset_iso_2022_jp']=false;

define('EMAIL_HOST',$email[DEVELOP_MODE]['host']);
define('EMAIL_PORT',$email[DEVELOP_MODE]['port']);
define('EMAIL_USER',$email[DEVELOP_MODE]['username']);
define('EMAIL_PASS',$email[DEVELOP_MODE]['password']);
define('EMAIL_FROM',$email[DEVELOP_MODE]['from']);
define('EMAIL_TRANSPORT',$email[DEVELOP_MODE]['transport']);
define('EMAIL_ENCRYPTION',$email[DEVELOP_MODE]['encryption']);
define('EMAIL_AUTH_MODE',$email[DEVELOP_MODE]['auth_mode']);
define('EMAIL_TIMEOUT',$email[DEVELOP_MODE]['timeout']);
define('EMAIL_CHARSET_ISO',$email[DEVELOP_MODE]['charset_iso_2022_jp']);

class EmailConfig{

	public $default=array(
		'host' => EMAIL_HOST,
		'port' => EMAIL_PORT,
		'username' => EMAIL_USER,
		'password' => EMAIL_PASS,
		'from' => EMAIL_FROM,
		'transport' => EMAIL_TRANSPORT,
		'encryption' => EMAIL_ENCRYPTION,
		'auth_mode' => EMAIL_AUTH_MODE,
		'timeout' => EMAIL_TIMEOUT,
		'charset_iso_2022_jp' => EMAIL_CHARSET_ISO
	);
}

# define sidebar menu
$sidebar_main_menu=[
	[
		'caption'=>'Dashboard',
		'url'=>'/'
	],
	[
		'caption'=>'Client',
		'url'=>['controller'=>'Client','action'=>'index'],
		'sub_menu'=>[
			[
				'caption'=>'Client list',
				'url'=>['controller'=>'Client','action'=>'index']
			],
			[
				'caption'=>'Add new client',
				'url'=>['/client/add_new']
			]
		]
	]
];

define('SIDEBAR_MAIN_MENU', $sidebar_main_menu);

# Locale Configuration
define('LANGUAGE_DEFAULT', 'jpn');

# libs にパスを通す
$path = APP."Lib";
set_include_path(get_include_path().PATH_SEPARATOR.$path);

?>
