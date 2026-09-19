<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '$DB_NAME' );

/** Database username */
define( 'DB_USER', '$DB_USER' );

/** Database password */
define( 'DB_PASSWORD', 'DB_PASSWORD' );

/** Database hostname */
define( 'DB_HOST', '$DB_HOST' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define('AUTH_KEY',         'qR+5gdc%-,?$V#@Jz3|ob~oEi(5TDam0mNht+Vp&#SaKz7_I|Jla2.?.kX^4!dP-');
define('SECURE_AUTH_KEY',  ' tZ.O+VAKY;>5W3_X)xpZ|b:/lI+bL{l$T.f-,ex$SBfN9,%-hE+MG<YDJqzdX-n');
define('LOGGED_IN_KEY',    '4P;X+rI[Y>1+yNuj[Op^,Z~+%mMEUmv>QIZSj`80r}/tYHQ;5FN9P=l{ap96@*6i');
define('NONCE_KEY',        '6cO[{&L|+|-T++wY$FL@utWV,(L>f:y8(1vKra7eg%e,(%rU]b0f6]V8c3bdJ-Fb');
define('AUTH_SALT',        'e%B/a7ZD|QQ,u4J1dkH|ScWK3gF,&-b~qeSK]DDl_??C`h|wE;RyJ8-enb=P*jJK');
define('SECURE_AUTH_SALT', 's[uY=~>?Cs2b&;UDYC`=FZV8%qKX}.8]ji9H-|oV4n4vgCr=BX~wmreM}nUch@6i');
define('LOGGED_IN_SALT',   'z%3|h Bo>FN%a)(-E5$^q.7x[@,fUy>j8@5/4mNq64vT]s<;VE:qTZ:!W N^-$HQ');
define('NONCE_SALT',       'Sz|Rj=EaV}q+~9-F>Uj[sWf-$Sa@S A2UH1$CE/<]yX()eHepe!ss&1?=X{ZJJBD');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
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
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
