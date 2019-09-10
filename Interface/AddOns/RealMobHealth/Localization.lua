--[[	RealMobHealth Localization Module
	by SDPhantom
	https://www.wowinterface.com/forums/member.php?u=34145	]]
------------------------------------------------------------------

----------------------------------
--[[	Localization Table	]]
----------------------------------
local Localization={
	enUS={
--		Commands
		Command_NoUnitData="Unit not found.";
		Command_DeletedUnitFormat="Deleted %2$s(%1$s)";--	format(CreatureKey,UnitName)
		Command_HealthWiped="Health data wiped.";

--		Options Panel
		Options_DynamicList={--	Button Text,Tooltip Title,Description
--					Tooltip Title=false to use Button Text
			ShowStatusBarTextAdditions={"Show TargetFrame Text",false,"Creates text for TargetFrame's bars."};
			ModifyHealthBarText={"Modify UnitFrame Health",false,"Shows real health values for mobs in default UnitFrames."};
			ShowTooltipText={"Show Tooltip Feedback",false,"Displays if a mob's health is present in Health Cache."};
			ShowTooltipHealthText={"Show Tooltip Health",false,"Shows health on the GameTooltip's StatusBar"};
			ShowNamePlateHealthText={"Show NamePlate Health",false,"Shows health on the left side of NamePlates."};

			EnablePeerCache={"Enable","Enable Peer Cache","Toggles receiving health data from others.\n|cffffff00Note: This addon will still answer queries and broadcast health updates.|r"};
		};
		Options_SetByAddOn="|cffff0000This option has been overridden by another addon.|r";

--		Options Cache Panels
		Options_HealthCachePanel={"Health Cache","Stores health data from mobs encountered."};
		Options_PeerCachePanel={"Peer Cache","Stores health data reported by others."};
		Options_CacheSizeLabel="Cache Size:";

--		Options Clear Cache Buttons
		Options_ClearCacheButtonText="Clear Cache";
		Options_ClearHealthCacheTTText="Clear Health Cache";
		Options_ClearPeerCacheTTText="Clear Peer Cache";
		Options_ClearCacheWarning="|cffff0000Warning! All data in this cache will be lost forever.|r";

--		UITweaks Tooltip Lines
		UITweaksTooltip_Blacklisted="Blacklisted Mob";
		UITweaksTooltip_HealthRecorded="Recorded Health Data";
		UITweaksTooltip_HealthOverride="Health Data Overridden";
		UITweaksTooltip_NoData="Missing Health Data";
	};
	frFR={--	Traduction By Pgmbru
--		Commandes
		Command_NoUnitData="Unité introuvable.";
		Command_DeletedUnitFormat="Supprimé %2$s(%1$s)";-- format (CreatureKey,UnitName)
		Command_HealthWiped="Données de santé effacées.";

--		Panneau d'options
		Options_DynamicList={--	Texte du bouton,titre de l'info-bulle,description
--					Titre de l'info-bulle=false pour utiliser le texte du bouton
			ShowStatusBarTextAdditions={"Afficher le texte dans le cadre cible",false,"Créer du texte pour les barres du cadre cible."};
			ModifyHealthBarText={"Modifier l'état de santé du cadre",false,"Affiche les valeurs de santé réelles pour les mobs dans les cadres par défaut."};
			ShowTooltipText={"Afficher les commentaires de l’info-bulle",false,"Indique si l’intégrité d’un groupe est présente dans le cache de santé."};
			ShowTooltipHealthText={"Afficher la santé de l'info-bulle",false,"Affiche la santé sur la barre d'état de l'info-bulle du jeu"};
			ShowNamePlateHealthText={"Afficher la santé de la plaquette de nom",false,"Affiche la santé sur le côté gauche de la plaquette de nom."};

			EnablePeerCache={"Activer","Activer le cache entre homologues","Activer / DésActiver la réception des données de santé des autres. \n|cffffff00Note: Cet addon répondra toujours aux requêtes et aux mises à jour de la santé.|r"};
		};

--		Panneaux de cache d'options
		Options_HealthCachePanel={"Cache de Santé","Stock des données de santé des mobs rencontrées."};
		Options_PeerCachePanel={"Cache des Pairs","Stock des données de santé déclarées par d'autres."};
		Options_CacheSizeLabel="Taille du cache:";

--		Options Effacer les boutons du cache
		Options_ClearCacheButtonText="Vider le cache";
		Options_ClearHealthCacheTTText="Effacer le cache de santé";
		Options_ClearPeerCacheTTText="Effacer le cache des pairs";
		Options_ClearCacheWarning="|cffff0000Attention! Toutes les données de ce cache seront définitivement perdues!|r";

--		Interface utilisateur Tooltip d'info-bulle
		UITweaksTooltip_Blacklisted="Mob sur la liste noire";
		UITweaksTooltip_HealthRecorded="Données de santé enregistrées";
		UITweaksTooltip_HealthOverride="Données de santé annulées";
		UITweaksTooltip_NoData="Données de santé manquantes";
	};
	zhCN={--	Traduction By Pgmbru
--		Commandes
		Command_NoUnitData="单位未发现";
		Command_DeletedUnitFormat="删除 %2$s(%1$s)";--	format(CreatureKey,UnitName)
		Command_HealthWiped="血量数据已擦除.";

--		Options Panel
		Options_DynamicList={--	Buttom Text, Tooltip Title, Description
--					Tooltip Title = false to use Button Text
			ShowStatusBarTextAdditions={"显示目标框架文本",false,"Creates text for TargetFrame's bars."};
			ModifyHealthBarText={"修改目标框架血量",false,"Shows real health values for mobs in default UnitFrames."};
			ShowTooltipText={"显示鼠标提示反馈",false,"Displays if a mob's health is present in Health Cache."};
			ShowTooltipHealthText={"显示鼠标提示血量",false,"Shows health on the GameTooltip's StatusBar"};
			ShowNamePlateHealthText={"显示姓名板血量",false,"Shows health on the left side of NamePlates."};

			EnablePeerCache={"启用","同步数据","Toggles receiving health data from others.\n|cffffff00Note: This addon will still answer queries and broadcast health updates.|r"};
		};

--		Options Cache Panels
		Options_HealthCachePanel={"血量缓存","Stores health data from mobs encountered."};
		Options_PeerCachePanel={"同步缓存","Stores health data reported by others."};
		Options_CacheSizeLabel="缓存大小:";

--		Options Clear Cache Buttons
		Options_ClearCacheButtonText="清除缓存";
		Options_ClearHealthCacheTTText="清除血量缓存";
		Options_ClearPeerCacheTTText="清除同步缓存";
		Options_ClearCacheWarning="|cffff0000警告！此缓存中的所有数据将永远丢失.|r";

--		UITweaks Tooltip Lines
		UITweaksTooltip_Blacklisted="黑名单中的怪物";
		UITweaksTooltip_HealthRecorded="血量数据已记录";
		UITweaksTooltip_HealthOverride="血量数据已覆盖";
		UITweaksTooltip_NoData="无血量数据";
	};
};

----------------------------------
--[[	Localization Loader	]]--	Nothing to localize below this line
----------------------------------
local DynamicOptionsMeta={__index=Localization.enUS.Options_DynamicList};
for locale,tbl in pairs(Localization) do if locale~="enUS" then setmetatable(tbl.Options_DynamicList,DynamicOptionsMeta); end end
select(2,...).Localization=setmetatable(Localization,{__index=Localization.enUS})[GetLocale()];
