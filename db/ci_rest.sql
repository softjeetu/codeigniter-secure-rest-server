-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 28, 2017 at 04:25 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_rest`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(40) NOT NULL DEFAULT '',
  `all_access` tinyint(1) NOT NULL DEFAULT '0',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(4) NOT NULL,
  `ip_addresses` text NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 2, 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', 1, 0, 0, '', 1488275634);

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'api-key:g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', 1, 1488278650, 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `response_code` int(11) NOT NULL,
  `params` text NOT NULL,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float NOT NULL,
  `authorized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `uri`, `method`, `response_code`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`) VALUES
(1, 'api/example/auth', 'post', 0, 'a:13:{s:5:"email";s:12:"jk@gmail.com";s:8:"password";s:9:"123456789";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"252";s:13:"Postman-Token";s:36:"44ad064a-fda3-8651-81e9-e941b9ef6ed4";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundaryl6qborAAMTXP23cE";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', '', '127.0.0.1', 1488275564, 0, 1),
(2, 'api/example/auth', 'post', 0, 'a:13:{s:5:"email";s:12:"jk@gmail.com";s:8:"password";s:9:"123456789";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"252";s:13:"Postman-Token";s:36:"0a28f5bd-8d08-e973-64e4-92b4ada10474";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundaryOL219wq30J0vDTdL";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', '', '127.0.0.1', 1488275584, 0, 1),
(3, 'api/example/auth', 'post', 200, 'a:13:{s:5:"email";s:12:"jk@gmail.com";s:8:"password";s:9:"123456789";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"252";s:13:"Postman-Token";s:36:"6d63b873-9516-cb7e-8739-3d46c676d407";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundaryxhP9EQztdpPMa8qb";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', '', '127.0.0.1', 1488275634, 0.00422502, 1),
(4, 'api/example/users/id/1', 'get', 403, 'a:10:{s:2:"id";s:1:"1";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"2ed15dbe844f5d23ed7466ee5838094c7154a131";s:13:"Postman-Token";s:36:"d88613f6-4653-c28f-b2c8-3b5ffc64ccd3";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:23:"gzip, deflate, sdch, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', '', '127.0.0.1', 1488275739, 0.003196, 0),
(5, 'api/example/users/id/1', 'get', 401, 'a:10:{s:2:"id";s:1:"1";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:13:"Postman-Token";s:36:"3811eda7-331b-099d-3ce4-8425a3442549";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:23:"gzip, deflate, sdch, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488275743, 0.00325203, 0),
(6, 'api/example/users/id/1', 'get', 200, 'a:10:{s:2:"id";s:1:"1";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:13:"Postman-Token";s:36:"cb07aa5a-079f-8fd0-8ad4-72ebef5a2435";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:23:"gzip, deflate, sdch, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488276157, 0.00329995, 1),
(7, 'api/example/users/id/1', 'get', 200, 'a:10:{s:2:"id";s:1:"1";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:13:"Postman-Token";s:36:"51d487ef-f383-b8bf-3bcd-d8b151ab280f";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:23:"gzip, deflate, sdch, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488276365, 0.00316286, 1),
(8, 'api/example/users/id/1', 'get', 200, 'a:10:{s:2:"id";s:1:"1";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:13:"Postman-Token";s:36:"ee288fef-9705-3248-8fa9-e65da4e20d98";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:23:"gzip, deflate, sdch, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488276470, 0.00276995, 1),
(9, 'api/example/users/id/1', 'get', 200, 'a:10:{s:2:"id";s:1:"1";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:13:"Postman-Token";s:36:"2b68110a-0c9a-a1a4-08cc-32b856b024d0";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:23:"gzip, deflate, sdch, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488276506, 0.00413203, 1),
(10, 'api/example/users/id/1', 'get', 200, 'a:10:{s:2:"id";s:1:"1";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:13:"Postman-Token";s:36:"9ed19553-0f4f-4df3-ad2c-3f8b41c2a36f";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:23:"gzip, deflate, sdch, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488276527, 0.00330019, 1),
(11, 'api/example/users', 'post', 201, 'a:14:{s:4:"name";s:14:"Jitendra Kumar";s:5:"email";s:31:"jitendra.trivialworks@gmail.com";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"272";s:13:"Postman-Token";s:36:"13c4ab4a-8ea7-6624-3d8f-259d83518f63";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundarykbOy9Sbf9X4VZ12Y";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488276889, 0.00319886, 1),
(12, 'api/example/users', 'post', 201, 'a:14:{s:4:"name";s:14:"Jitendra Kumar";s:5:"email";s:31:"jitendra.trivialworks@gmail.com";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"272";s:13:"Postman-Token";s:36:"74af97ec-9f31-133c-e9e3-53983e0dabe8";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundaryLidSHcl8COnSvJJQ";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488276951, 0.00394011, 1),
(13, 'api/example/users/id/1', 'get', 200, 'a:10:{s:2:"id";s:1:"1";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:13:"Postman-Token";s:36:"53807ead-d16f-f156-a383-6a5871406b6c";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:23:"gzip, deflate, sdch, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488277382, 0.00306702, 1),
(14, 'api/example/users', 'post', 201, 'a:14:{s:4:"name";s:14:"Jitendra Kumar";s:5:"email";s:31:"jitendra.trivialworks@gmail.com";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"272";s:13:"Postman-Token";s:36:"102d4583-f0a7-c925-5387-ff42d82df745";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundaryaeoZz4eObiwVcuHB";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488277393, 0.00381899, 1),
(15, 'api/example/users', 'post', 403, 'a:14:{s:4:"name";s:14:"Jitendra Kumar";s:5:"email";s:31:"jitendra.trivialworks@gmail.com";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"272";s:13:"Postman-Token";s:36:"1228e1b2-ae19-c93f-ba44-6336bc5d985e";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:41:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscws";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundarydMMG3N8X3zedzziT";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', '', '127.0.0.1', 1488277953, 0.00383401, 0),
(16, 'api/example/users', 'post', 201, 'a:14:{s:4:"name";s:14:"Jitendra Kumar";s:5:"email";s:31:"jitendra.trivialworks@gmail.com";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"272";s:13:"Postman-Token";s:36:"920846f6-3b91-62f9-71e5-02c77003af14";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundaryGrBfVORnYQS70G0M";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488277957, 0.00272417, 1),
(17, 'api/example/users', 'post', 201, 'a:14:{s:4:"name";s:14:"Jitendra Kumar";s:5:"email";s:31:"jitendra.trivialworks@gmail.com";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"272";s:13:"Postman-Token";s:36:"736a2d88-476e-af14-3ed4-0a48ddc8f1e9";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundaryNV2dFYKhN1nbBce8";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488278062, 0.00351882, 1),
(18, 'api/example/users', 'post', 201, 'a:14:{s:4:"name";s:14:"Jitendra Kumar";s:5:"email";s:31:"jitendra.trivialworks@gmail.com";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"272";s:13:"Postman-Token";s:36:"affe18e7-b5a6-cbaf-dd8a-9f600188cd25";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundary869ieQcSBFxf3MKZ";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488278217, 0.00262713, 1),
(19, 'api/example/users', 'post', 201, 'a:14:{s:4:"name";s:14:"Jitendra Kumar";s:5:"email";s:31:"jitendra.trivialworks@gmail.com";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"272";s:13:"Postman-Token";s:36:"72937800-86b0-d14f-9a02-f7ae456d033a";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundaryY8sYXgexBns7xOv6";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488278238, 0.00297284, 1),
(20, 'api/example/users', 'post', 201, 'a:14:{s:4:"name";s:14:"Jitendra Kumar";s:5:"email";s:31:"jitendra.trivialworks@gmail.com";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"272";s:13:"Postman-Token";s:36:"c3d52943-0220-70c3-8710-9bf9326e249a";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundaryrLxi4cdtV9Mj6F0w";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488278394, 0.003124, 1),
(21, 'api/example/users', 'post', 201, 'a:14:{s:4:"name";s:14:"Jitendra Kumar";s:5:"email";s:31:"jitendra.trivialworks@gmail.com";s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:14:"Content-Length";s:3:"272";s:13:"Postman-Token";s:36:"138846cc-426a-53c5-c15a-ace4d8a2dec1";s:13:"Cache-Control";s:8:"no-cache";s:6:"Origin";s:51:"chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop";s:10:"User-Agent";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36";s:9:"X-API-KEY";s:40:"g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw";s:12:"Content-Type";s:68:"multipart/form-data; boundary=----WebKitFormBoundaryoZpyBlXWDHL3nOAU";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:17:"gzip, deflate, br";s:15:"Accept-Language";s:14:"en-US,en;q=0.8";}', 'g8c8sww40c8c88k4co080oo04o4kwgk88kwskscw', '127.0.0.1', 1488278650, 0.00380707, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(40) NOT NULL,
  `activation_code` varchar(40) NOT NULL,
  `forgotten_password_code` varchar(40) NOT NULL,
  `forgotten_password_time` int(10) UNSIGNED NOT NULL,
  `remember_code` varchar(40) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `last_login` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userName`, `email`, `password`, `salt`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `active`, `ip_address`, `last_login`, `createdOn`, `updatedOn`) VALUES
(1, 'Admin', 'admin@gmail.com', '123456789', '', '', '', 0, '', 1, '', 1484057371, '2016-07-04 00:00:00', '0000-00-00 00:00:00'),
(2, 'jitendrakumar', 'jk@gmail.com', '123456789', '', '', '46230645', 1474453170, '', 1, '', 0, '2016-08-23 07:49:03', '0000-00-00 00:00:00'),
(31, 'sandrakindavong', 'sandrakindavong@gmail.com', '123456789', '', 'a72e0b6b57aec15cc224c579fc491d230ffbf7f0', '', 0, '', 0, '', 0, '2016-09-22 13:04:02', '0000-00-00 00:00:00'),
(38, 'rekhakushwaha', 'rekhakushwaha@yahoo.com', '123456789', '', '', '', 0, '', 1, '', 0, '2016-10-05 10:26:53', '0000-00-00 00:00:00'),
(29, 'Cod King', 'codking@gmail.com', '123456789', '', '', '', 0, '', 1, '', 0, '2016-09-21 10:20:41', '0000-00-00 00:00:00'),
(28, 'ajaysingh', 'ajaysingh@gmail.com', '123456789', '', '', '8a6a5af8', 1474452987, '', 1, '', 0, '2016-09-21 09:39:10', '0000-00-00 00:00:00'),
(50, 'joe.roger@gmail.com', 'joe.roger@gmail.com', '123456789', '', '', '', 0, '', 0, '', 0, '2016-10-13 11:47:16', '0000-00-00 00:00:00'),
(51, 'mudgale.raj@gmail.com', 'mudgale.raj@gmail.com', '123456789', '', '', '', 0, '', 0, '', 0, '2016-10-14 07:30:00', '0000-00-00 00:00:00'),
(53, 'rajana.p@gmail.com', 'rajana.p@gmail.com', '123456789', '', '', '', 0, '', 0, '', 0, '2016-10-14 09:57:14', '0000-00-00 00:00:00'),
(54, 'milon.mac@gmail.com', 'milon.mac@gmail.com', '123456789', '', '', '', 0, '', 0, '', 0, '2016-10-14 10:17:34', '0000-00-00 00:00:00'),
(55, 'rog.krag@gmail.com', 'rog.krag@gmail.com', '123456789', '', '', '', 0, '', 0, '', 0, '2016-10-14 10:18:46', '0000-00-00 00:00:00'),
(56, 'moon.david@gmail.com', 'moon.david@gmail.com', '123456789', '', '', '', 0, '', 0, '', 0, '2016-10-14 10:20:21', '0000-00-00 00:00:00'),
(57, 'adam.jo@gmail.com', 'adam.jo@gmail.com', '123456789', '', '', '', 0, '', 0, '', 0, '2016-10-14 10:23:35', '0000-00-00 00:00:00'),
(58, 'singh.raj@gamil.com', 'singh.raj@gamil.com', '123456789', '', '', '', 0, '', 0, '', 0, '2016-10-17 14:02:52', '0000-00-00 00:00:00'),
(63, 'sudhir1.trivialworks@gmail.com', 'sudhir1.trivialworks@gmail.com', '123456789', '', '', '', 0, '', 1, '\0\0', 0, '2016-10-18 06:18:26', '0000-00-00 00:00:00'),
(88, 'Rekha1', 'rekhaverma053@gmail.com', '123456789', '', '', '', 0, '', 1, '???', 0, '2016-11-09 05:39:50', '0000-00-00 00:00:00'),
(91, 'Rekha3', 'jitendra.trivialworks@gmail.com', '123456789', '', '', '', 0, '', 1, '???', 1483083724, '2016-11-09 09:26:22', '0000-00-00 00:00:00'),
(86, 'sudhir33', 'sudhir44444444.trivialworks@gmail.com', '123456789', '', '0f161174b58d5b40845ed91c0a109041619c6708', '', 0, '', 0, '\0\0', 0, '2016-11-09 05:03:57', '0000-00-00 00:00:00'),
(87, 'Rekha', 'rekha.trivialworks@gmail.com', '123456789', '', '', '', 0, '', 1, '???', 0, '2016-11-09 05:36:45', '0000-00-00 00:00:00'),
(96, 'Ramson', 'sudhir.trivialworks@gmail.com', '123456789', '', '', '', 0, '', 1, '???', 1483083709, '2016-11-11 08:00:31', '0000-00-00 00:00:00'),
(92, 'rekhagggggg.trivialworks@gmail.com', 'rekhagggggg.trivialworks@gmail.com', '123456789', '', '', '', 0, '', 0, '', 0, '2016-11-09 11:33:48', '0000-00-00 00:00:00'),
(95, 'testMANAggg', 'mng@gmail.com', '123456789', '', '8fb2631b6279b959405fd19fff3ad4e0801d38f0', '', 0, '', 0, '???', 0, '2016-11-09 13:22:55', '0000-00-00 00:00:00'),
(97, 'jitendra', 'jitendrapal294@gmail.com', '123456789', '', '', '', 0, '', 1, '\0\0', 1483101052, '2016-12-30 05:50:20', '0000-00-00 00:00:00'),
(99, 'Kaneez', 'kaneez.trivialworks@gmail.com', '123456789', '', '', '64ca8ae9', 1483965778, '', 1, '???', 1484055560, '2017-01-09 12:32:08', '0000-00-00 00:00:00'),
(98, 'Kamaran', 'kamran.trivialworks@gmail.com', '123456789', '', '', 'cf559c69', 1483967490, '', 1, '???', 1484113518, '2016-12-30 12:42:18', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
