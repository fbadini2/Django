/* Ejecutar en orden desde la consola de MySQL 
o desde MySQL Workbench */


/* Crea la BD */
CREATE DATABASE academia;


/* Crea la tabla auxiliar provincia */

use academia;
CREATE TABLE `provincia` (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `desc_provincia` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

/* Insertar las provincias en la tabla provincia */

INSERT INTO `provincia` VALUES (1,''),(2,'Buenos Aires'),(3,'Catamarca'),(4,'Ciudad Autónoma de Buenos Aires'),(5,'Chaco'),(6,'Chubut'),(7,'Córdoba'),(8,'Corrientes'),(9,'Entre Rios'),(10,'Formosa'),(11,'Jujuy'),(12,'La Pampa'),(13,'La Rioja'),(14,'Mendoza'),(15,'Misiones'),(16,'Neuquén'),(17,'Río Negro'),(18,'Salta'),(19,'San Juan'),(20,'San Luis'),(21,'Santa Cruz'),(22,'Santa Fe'),(23,'Santiago del Estero'),(24,'Tierra del Fuego'),(25,'Tucumán');

/* Crea la tabla auxiliar pais */

use academia;
CREATE TABLE `pais` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `desc_pais` varchar(75) DEFAULT NULL,
  `iso2` varchar(2) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `isonum` int NOT NULL,
  `bandera` blob,
  `numorden` int DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


/* Inserta los paises en la tabla pais */

use academia;
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('','','',	0,1);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Afghanistan','AF','AFG',4,2);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Aland Islands','AX','ALA',248,3);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Albania','AL','ALB',8,4);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Algeria','DZ','DZA',12,5);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('American Samoa','AS','ASM',16,6);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Andorra','AD','AND',20,7);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Angola','AO','AGO',24,8);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Anguilla','AI','AIA',660,9);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Antigua and Barbuda','AG','ATG',28,10);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Argentina','AR','ARG',32,11);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Armenia','AM','ARM',51,12);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Aruba','AW','ABW',533,13);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Australia','AU','AUS',36,14);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Austria','AT','AUT',40,15);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Azerbaijan','AZ','AZE',31,16);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Bahamas','BS','BHS',44,17);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Bahrain','BH','BHR',48,18);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Bangladesh','BD','BGD',50,19);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Barbados','BB','BRB',52,20);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Belarus','BY','BLR',112,21);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Belgium','BE','BEL',56,22);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Belize','BZ','BLZ',84,23);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Benin','BJ','BEN',204,24);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Bermuda','BM','BMU',60,25);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Bhutan','BT','BTN',64,26);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Bolivia','BO','BOL',68,27);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Bonaire, Sint Eustatius and Saba','BQ','BES',535,28);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Bosnia and Herzegovina','BA','BIH',70,29);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Botswana','BW','BWA',72,30);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Bouvet Island','BV','BVT',74,31);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Brazil','BR','BRA',76,32);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('British Indian Ocean Territory','IO','IOT',86,33);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Brunei Darussalam','BN','BRN',96,34);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Bulgaria','BG','BGR',100,35);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Burkina Faso','BF','BFA',854,36);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Burundi','BI','BDI',108,37);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Cambodia','KH','KHM',116,38);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Cameroon','CM','CMR',120,39);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Canada','CA','CAN',124,40);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Cape Verde','CV','CPV',132,41);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Cayman Islands','KY','CYM',136,42);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Central African Republic','CF','CAF',140,43);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Chad','TD','TCD',148,44);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Chile','CL','CHL',152,45);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('China, People´s Republic of','CN','CHN',156,46);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Christmas Island','CX','CXR',162,47);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Cocos (Keeling) Islands','CC','CCK',166,48);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Colombia','CO','COL',170,49);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Comoros','KM','COM',174,50);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Congo, Republic of the','CG','COG',178,51);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Congo, the Democratic Republic of the','CD','COD',180,52);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Cook Islands','CK','COK',184,53);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Costa Rica','CR','CRI',188,54);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Côte d´Ivoire','CI','CIV',384,55);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Croatia','HR','HRV',191,56);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Cuba','CU','CUB',192,57);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Curaçao','CW','CUW',531,58);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Cyprus','CY','CYP',196,59);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Czech Republic','CZ','CZE',203,60);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Denmark','DK','DNK',208,61);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Djibouti','DJ','DJI',262,62);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Dominica','DM','DMA',212,63);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Dominican Republic','DO','DOM',214,64);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Ecuador','EC','ECU',218,65);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Egypt','EG','EGY',818,66);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('El Salvador','SV','SLV',222,67);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Equatorial Guinea','GQ','GNQ',226,68);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Eritrea','ER','ERI',232,69);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Estonia','EE','EST',233,70);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Ethiopia','ET','ETH',231,71);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Falkland Islands (Malvinas)','FK','FLK',238,72);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Faroe Islands','FO','FRO',234,73);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Fiji','FJ','FJI',242,74);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Finland','FI','FIN',246,75);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('France','FR','FRA',250,76);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('French Guiana','GF','GUF',254,77);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('French Polynesia','PF','PYF',258,78);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('French Southern Territories','TF','ATF',260,79);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Gabon','GA','GAB',266,80);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Gambia','GM','GMB',270,81);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Georgia','GE','GEO',268,82);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Germany','DE','DEU',276,83);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Ghana','GH','GHA',288,84);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Gibraltar','GI','GIB',292,85);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Greece','GR','GRC',300,86);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Greenland','GL','GRL',304,87);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Grenada','GD','GRD',308,88);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Guadeloupe','GP','GLP',312,89);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Guam','GU','GUM',316,90);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Guatemala','GT','GTM',320,91);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Guernsey','GG','GGY',831,92);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Guinea','GN','GIN',324,93);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Guinea-Bissau','GW','GNB',624,94);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Guyana','GY','GUY',328,95);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Haiti','HT','HTI',332,96);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Heard Island and McDonald Islands','HM','HMD',334,97);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Holy See (Vatican City State)','VA','VAT',336,98);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Honduras	','HN','HND',340,99);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Hong Kong','HK','HKG',344,100);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Hungary','HU','HUN',348,101);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Iceland','IS','ISL',352,102);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('India','IN','IND',356,103);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Indonesia','ID','IDN',360,104);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Iran, Islamic Republic of','IR','IRN',364,105);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Iraq','IQ','IRQ',368,106);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Ireland','IE','IRL',372,107);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Isle of Man','IM','IMN',833,108);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Israel','IL','ISR',376,109);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Italy','IT','ITA',380,110);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Jamaica','JM','JAM',388,111);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Japan','JP','JPN',392,112);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Jersey','JE','JEY',832,113);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Jordan','JO','JOR',400,114);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Kazakhstan','KZ','KAZ',398,115);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Kenya','KE','KEN',404,116);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Kiribati','KI','KIR',296,117);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Korea, Democratic People´s Republic of','KP','PRK',408,118);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Korea, Republic of','KR','KOR',410,119);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Kuwait','KW','KWT',414,120);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Kyrgyzstan','KG','KGZ',417,121);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Laos People´s Democratic Republic','LA','LAO',418,122);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Latvia','LV','LVA',428,123);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Lebanon','LB','LBN',422,124);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Lesotho','LS','LSO',426,125);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Liberia','LR','LBR',430,126);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Libya','LY','LBY',434,127);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Liechtenstein','LI','LIE',438,128);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Lithuania','LT','LTU',440,129);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Luxembourg','LU','LUX',442,130);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Macao','MO','MAC',446,131);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Macedonia, The Former Yugoslav Republic of','MK','MKD',807,132);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Madagascar','MG','MDG',450,133);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Malawi','MW','MWI',454,134);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Malaysia','MY','MYS',458,135);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Maldives','MV','MDV',462,136);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Mali','ML','MLI',466,137);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Malta','MT','MLT',470,138);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Marshall Islands','MH','MHL',584,139);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Martinique','MQ','MTQ',474,140);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Mauritania','MR','MRT',478,141);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Mauritius','MU','MUS',480,142);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Mayotte','YT','MYT',175,143);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Mexico','MX','MEX',484,144);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Micronesia, Federated States of','FM','FSM',583,145);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Moldova, Republic of','MD','MDA',498,146);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Monaco','MC','MCO',492,147);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Mongolia','MN','MNG',496,148);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Montenegro','ME','MNE',499,149);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Montserrat','MS','MSR',500,150);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Morocco','MA','MAR',504,151);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Mozambique','MZ','MOZ',508,152);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Myanmar','MM','MMR',104,153);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Namibia','NA','NAM',516,154);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Nauru','NR','NRU',520,155);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Nepal','NP','NPL',524,156);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Netherlands','NL','NLD',528,157);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('New Caledonia','NC','NCL',540,158);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('New Zealand','NZ','NZL',554,159);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Nicaragua','NI','NIC',558,160);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Niger','NE','NER',562,161);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Nigeria','NG','NGA',566,162);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Niue','NU','NIU',570,163);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Norfolk Island','NF','NFK',574,164);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Northern Mariana Islands','MP','MNP',580,165);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Norway','NO','NOR',578,166);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Oman','OM','OMN',512,167);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Pakistan','PK','PAK',586,168);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Palau','PW','PLW',585,169);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Palestine, State of','PS','PSE',275,170);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Panama','PA','PAN',591,171);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Papua New Guinea','PG','PNG',598,172);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Paraguay','PY','PRY',600,173);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Peru','PE','PER',604,174);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Philippines','PH','PHL',608,175);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Pitcairn','PN','PCN',612,176);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Poland','PL','POL',616,177);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Portugal','PT','PRT',620,178);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Puerto Rico','PR','PRI',630,179);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Qatar','QA','QAT',634,180);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Réunion','RE','REU',638,181);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Romania','RO','ROU',642,182);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Russian Federation','RU','RUS',643,183);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Rwanda','RW','RWA',646,184);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Saint Barthélemy','BL','BLM',652,185);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Saint Helena, Ascension and Tristan da Cunha','SH','SHN',654,186);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Saint Kitts and Nevis','KN','KNA',659,187);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Saint Lucia','LC','LCA',662,188);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Saint Martin (French part)','MF','MAF',663,189);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Saint Pierre and Miquelon','PM','SPM',666,190);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Saint Vincent and the Grenadines','VC','VCT',670,191);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Samoa','WS','WSM',882,192);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('San Marino','SM','SMR',674,193);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Sao Tome and Principe','ST','STP',678,194);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Saudi Arabia','SA','SAU',682,195);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Senegal','SN','SEN',686,196);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Serbia','RS','SRB',688,197);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Seychelles','SC','SYC',690,198);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Sierra Leone','SL','SLE',694,199);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Singapore','SG','SGP',702,200);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Sint Maarten (Dutch part)','SX','SXM',534,201);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Slovakia','SK','SVK',703,202);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Slovenia','SI','SVN',705,203);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Solomon Islands','SB','SLB',90,204);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Somalia','SO','SOM',706,205);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('South Africa','ZA','ZAF',710,206);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('South Georgia and the South Sandwich Islands','GS','SGS',239,207);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('South Sudan','SS','SSD',728,208);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Spain','ES','ESP',724,209);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Sri Lanka','LK','LKA',144,210);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Sudan','SD','SDN',729,211);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Suriname','SR','SUR',740	,212);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Svalbard and Jan Mayen','SJ','SJM',744,213);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Swaziland','SZ','SWZ',748,214);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Sweden','SE','SWE',752,215);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Switzerland','CH','CHE',756,216);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Syrian Arab Republic','SY','SYR',760,217);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Taiwan, Province of China','TW','TWN',158,218);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Tajikistan','TJ','TJK',762,219);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Tanzania, United Republic of','TZ','TZA',834,220);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Thailand','TH','THA',764,221);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Timor-Leste','TL','TLS',	626,222);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Togo','TG','TGO',768,223);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Tokelau','TK','TK',772,224);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Tonga','TO','TON',776,225);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Trinidad and Tobago','TT','TTO',780,226);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Tunisia','TN','TUN',788,227);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Türkiye','TR','TUR',792,228);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Turkmenistan','TM','TKM',795,229);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Turks and Caicos Islands	','TC','TCA',796,230);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Tuvalu','TV','TUV',798,231);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Uganda','UG','UGA',800,232);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Ukraine','UA','UKR',804,233);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('United Arab Emirates','AE','ARE',784,234);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('United Kingdom','GB','GBR',826,235);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('United States','US','USA',840,236);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('United States Minor Outlying Islands','UM','UMI',581,237);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Uruguay','UY','URY',858,238);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Uzbekistan','UZ','UZB',860,239);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Vanuatu','VU','VUT',548,240);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Venezuela, Bolivarian Republic of','VE','VEN',862,241);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Viet Nam','VN','VNM',704,242);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Virgin Islands, British','VG','VGB',92,243);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Virgin Islands, U.S.','VI','VIR',850,244);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Wallis and Futuna','WF','WLF',876,245);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Western Sahara','EH','ESH',732,246);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Yemen','YE','YEM',887,247);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Zambia','ZM','ZMB',894,248);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Zimbabwe','ZW','ZWE',716,249);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Kosovo','KO','KOS',9999,120);
INSERT INTO pais (desc_pais, iso2, iso3, isonum, numorden) VALUES ('Sahrawi Arab Democratic Republic','EH','ESH',732,184);


/* Crea la tabla alumno */

use academia;
CREATE TABLE `alumno` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) DEFAULT NULL,
  `apellido` varchar(75) DEFAULT NULL,
  `tipo_doc` varchar(5) NOT NULL DEFAULT '',
  `nro_doc` varchar(15) NOT NULL DEFAULT '',
  `foto` blob,
  `fec_nacimiento` varchar(10) NOT NULL DEFAULT '',
  `id_provincia` int NOT NULL DEFAULT '1',
  `id_pais` int NOT NULL DEFAULT '1',
  `tipo_tel` varchar(5) NOT NULL DEFAULT '',
  `nro_tel` varchar(75) NOT NULL DEFAULT '',
  `correo` varchar(100) NOT NULL DEFAULT '',
  `fec_inicio` varchar(10) NOT NULL DEFAULT '',
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id_alumno`),
  KEY `id_provincia` (`id_provincia`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`),
  CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


/* Crea la tabla profesor */

use academia;
CREATE TABLE `profesor` (
  `id_profesor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) DEFAULT NULL,
  `apellido` varchar(75) DEFAULT NULL,
  `tipo_doc` varchar(5) NOT NULL DEFAULT '',
  `nro_doc` varchar(15) NOT NULL DEFAULT '',
  `foto` blob,
  `fec_nacimiento` varchar(10) NOT NULL DEFAULT '',
  `id_provincia` int NOT NULL DEFAULT '1',
  `id_pais` int NOT NULL DEFAULT '1',
  `tipo_tel` varchar(5) NOT NULL DEFAULT '',
  `nro_tel` varchar(75) NOT NULL DEFAULT '',
  `correo` varchar(100) NOT NULL DEFAULT '',
  `fec_inicio` varchar(10) NOT NULL DEFAULT '',
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id_profesor`),
  KEY `id_provincia` (`id_provincia`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`),
  CONSTRAINT `profesor_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


/* Crea la tabla materia */

use academia;
CREATE TABLE `materia` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `materia` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



/* Crea la tabla clase */

use academia;
CREATE TABLE `clase` (
  `id_clase` int NOT NULL AUTO_INCREMENT,
  `clase` varchar(35) DEFAULT NULL,
  `periodo` int DEFAULT NULL,
  `id_materia` int NOT NULL,
  `id_profesor` int NOT NULL,
  `capacidad` int DEFAULT '0',
  PRIMARY KEY (`id_clase`),
  KEY `id_materia` (`id_materia`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `clase_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

/* Crea la tabla alumno_clase */

use academia;
CREATE TABLE `alumno_clase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int NOT NULL,
  `id_clase` int NOT NULL,
  `faltas` int NOT NULL DEFAULT 0,
  `calificacion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_clase` (`id_clase`),
  CONSTRAINT `alumno_clase_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `alumno_clase_ibfk_2` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci