-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 31 Août 2017 à 01:54
-- Version du serveur :  10.1.21-MariaDB
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `youssef2`
--

-- --------------------------------------------------------

--
-- Structure de la table `ext_log_entries`
--

CREATE TABLE `ext_log_entries` (
  `id` int(11) NOT NULL,
  `action` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `logged_at` datetime NOT NULL,
  `object_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ext_translations`
--

CREATE TABLE `ext_translations` (
  `id` int(11) NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `publishedAt` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `published` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `publishedAt`, `created_at`, `published`) VALUES
(4, 'test', '<p>test</p>', NULL, '2017-08-31 01:17:24', 1),
(5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '<p>Proin condimentum nec magna at venenatis. Fusce consectetur justo non dolor pharetra, eu consequat est fermentum. Pellentesque fringilla odio purus, non fringilla enim sodales id. Maecenas vitae ligula at enim dictum dignissim a quis elit. Integer ac ligula quis odio mattis fermentum eu sed metus. In iaculis purus id auctor accumsan. Etiam aliquet vehicula risus, id faucibus nibh molestie sit amet. Ut convallis dictum tristique.</p>\r\n\r\n<p>Nulla fringilla, lacus non faucibus lacinia, orci felis cursus quam, nec dapibus turpis enim vel arcu. Etiam tincidunt scelerisque mollis. Aenean et justo eleifend, volutpat lorem eu, fringilla risus. Duis in feugiat ligula, ac ullamcorper neque. Morbi ac risus accumsan dolor fermentum tempor eget vel tortor. Nam rutrum augue eu odio egestas cursus. Cras sodales ultrices nibh, in tincidunt dolor ultrices eu. Sed sit amet lacus feugiat, lobortis felis at, vulputate massa. Suspendisse diam odio, iaculis nec pharetra eu, ultricies at dolor. Cras convallis malesuada nibh at porttitor. Curabitur ullamcorper maximus quam, vel bibendum orci rutrum id. Mauris maximus volutpat iaculis. Mauris suscipit nec dui sit amet fringilla. Nulla at consequat leo. Suspendisse porta et turpis sed efficitur. Fusce et nulla ut massa pretium fringilla.</p>', NULL, '2017-08-31 01:32:39', 1),
(6, 'Fusce pulvinar ex at congue viverra. Maecenas vehicula elit auctor velit fringilla,', '<p>laoreet tincidunt. Proin enim urna, efficitur ut dictum eu, tristique id erat. Integer faucibus facilisis rhoncus. Morbi lacinia velit vel viverra tincidunt. Aenean porttitor tellus enim, faucibus accumsan ex vehicula quis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi metus massa, facilisis vel sapien at, ornare efficitur sapien. Ut posuere lorem tellus, nec pulvinar nisl fringilla et. In venenatis molestie metus nec suscipit. Nulla vulputate nibh sed massa imperdiet ultrices.</p>\r\n\r\n<p>Integer imperdiet lacus ut facilisis consectetur. Praesent euismod dapibus leo, ac lobortis sem ornare nec. Nunc vestibulum massa et quam venenatis suscipit. Nam euismod ante quis euismod tincidunt. Nulla luctus, lectus egestas varius tincidunt, massa felis dignissim metus, non vestibulum eros felis non nunc. Etiam suscipit tempus orci, sit amet auctor neque imperdiet accumsan. Nullam eget arcu nec massa euismod gravida eu non neque. Aenean rutrum, dui nec venenatis sagittis, enim mauris pharetra nulla, non volutpat dui neque ac urna.</p>', NULL, '2017-08-31 01:32:53', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `created_at`, `updated_at`, `date_of_birth`, `firstname`, `lastname`, `website`, `biography`, `gender`, `locale`, `timezone`, `phone`, `facebook_uid`, `facebook_name`, `facebook_data`, `twitter_uid`, `twitter_name`, `twitter_data`, `gplus_uid`, `gplus_name`, `gplus_data`, `token`, `two_step_code`, `address`) VALUES
(1, 'youssef', 'youssef', 'youssef@gmail.com', 'youssef@gmail.com', 1, 'te4x6gbhpog4co8sgwk0w0cock8sgc8', 'DGHekMvDjtIWwlWkNPi42Y92s6N9E3QXeoDZdWifK9mb1tzmTEkD/vWyzs2qdw5J5ahIXulKl7eDn0M2Qwe87Q==', '2017-07-18 10:08:29', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '2017-07-16 22:17:23', '2017-07-18 10:08:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, NULL),
(2, 'admin', 'admin', 'admin@example.com', 'admin@example.com', 1, '5vznylt1xk4kkg48c4gskwkkcos8wkc', '/XIrBPT6e8LBYLPgzT2emw5mbVZ2V+CT9TIaMQYgEPdtUIjO+oxXpQdj/ZNh6wPFugeqjPFtOL0KShh8zYzZ3g==', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '2017-07-17 00:24:33', '2017-07-17 00:24:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, NULL),
(3, 'a.daif', 'a.daif', 'a.daif@gmail.com', 'a.daif@gmail.com', 1, 'd6ewpct8hdwk08sgcg0sgkgw0ksc440', 'iHQomvmIGR59iFKm31TQN8pD3X/jMyVIL4IFoIo9zzligfWC4JJHU0eRD8Xas/K9U/Aa6YoLkZXZe7kx/BaGfg==', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '2017-08-20 13:43:40', '2017-08-20 13:43:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, NULL),
(5, 'abde', 'abde', 'abde@gmail.com', 'abde@gmail.com', 1, '9avrpbuask4cg0g4o04ko4ok80g0kwc', 'AJByQ2lFPbZ+1yK/GscTizKYr1sQ8igRHb7AFOrOurf0s9sD+U9InrTJy5LjoMPaIcRft8Q0wPJOKARoDppbVA==', '2017-08-30 23:47:26', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', 0, NULL, '2017-08-30 23:47:11', '2017-08-30 23:47:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_group`
--

CREATE TABLE `user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ext_log_entries`
--
ALTER TABLE `ext_log_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_class_lookup_idx` (`object_class`),
  ADD KEY `log_date_lookup_idx` (`logged_at`),
  ADD KEY `log_user_lookup_idx` (`username`),
  ADD KEY `log_version_lookup_idx` (`object_id`,`object_class`,`version`);

--
-- Index pour la table `ext_translations`
--
ALTER TABLE `ext_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_class`,`field`,`foreign_key`),
  ADD KEY `translations_lookup_idx` (`locale`,`object_class`,`foreign_key`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4B98C215E237E06` (`name`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`);

--
-- Index pour la table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `IDX_8F02BF9DA76ED395` (`user_id`),
  ADD KEY `IDX_8F02BF9DFE54D947` (`group_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `ext_log_entries`
--
ALTER TABLE `ext_log_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ext_translations`
--
ALTER TABLE `ext_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `FK_8F02BF9DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_8F02BF9DFE54D947` FOREIGN KEY (`group_id`) REFERENCES `groupe` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
