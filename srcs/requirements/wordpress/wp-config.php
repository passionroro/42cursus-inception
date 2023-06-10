<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wordpress_user' );

/** Database password */
define( 'DB_PASSWORD', 'wordpress_password' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'vHw<)Vc5/0TV}~@P3O|Qkru82>]yn@e &z_;:SEb?<jep):J!yeXIj*-+@il[tG1');
define('SECURE_AUTH_KEY',  ' `nA8)NN$0wLuo{AesMY `@=GnQ|#(%D~Hn)`-)u#Cps7$%O,Eb)N3h$T:{i1=.<');
define('LOGGED_IN_KEY',    'oRr1VR<|~NT+xuE2c]* )n(-zJdH9M8on;$+}@Ll&rlCnU$`8Nx7djKJ mkv|;Ds');
define('NONCE_KEY',        's+l*Gd7Df+BnN!B5knKpF+52DgJMi0`-K_b>,YkZb+I5B[eN5^BD:kfZt186#zl!');
define('AUTH_SALT',        'Zd7MS*zsV^E>3fEbCKuhmO{G?47% ar$B8JK,2A~~w9hbHNtCQtLIh|<opbIP|5S');
define('SECURE_AUTH_SALT', 'd8O$U(<=%xyEpwvfZuZhoQEO.llpTG(+Z!y9v([Dq&&8OH5=+DBh=v%.P-`L=-j3');
define('LOGGED_IN_SALT',   'h-@rAe>I0Fw?fS`FRGT=-Z/JmjLB0wSWfyCoq7$ma]}+D04Y@noe$^~Uwj.392UD');
define('NONCE_SALT',       '#c;t9rma;t,9_n^]w!?k8`|>|1Ks|?W?vtX-Na^b+4g36+awLA[<j#X#{Fj$^U/1');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */

define('FS_METHOD', 'direct');

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
