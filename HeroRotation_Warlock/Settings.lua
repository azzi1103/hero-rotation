--- ============================ HEADER ============================
--- ======= LOCALIZE =======
-- Addon
local addonName, addonTable = ...
-- HeroRotation
local HR = HeroRotation
-- HeroLib
local HL = HeroLib
-- File Locals
local GUI = HL.GUI
local CreateChildPanel = GUI.CreateChildPanel
local CreatePanelOption = GUI.CreatePanelOption
local CreateARPanelOption = HR.GUI.CreateARPanelOption
local CreateARPanelOptions = HR.GUI.CreateARPanelOptions

--- ============================ CONTENT ============================
-- All settings here should be moved into the GUI someday.
HR.GUISettings.APL.Warlock = {
  Commons = {
    Enabled = {
      Potions = true,
      Trinkets = true,
    },
    DisplayStyle = {
      Potions = "Suggested",
      Trinkets = "Suggested",
      Covenant = "Suggested",
    },
    -- {Display GCD as OffGCD, ForceReturn}
    GCDasOffGCD = {
      -- Abilities
    },
    -- {Display OffGCD as OffGCD, ForceReturn}
    OffGCDasOffGCD = {
      -- Racials
      Racials = true,
      -- Abilities
      SpellLock = true,
    }
  },
  --[[Destruction = {
    UnendingResolveHP = 20,
    UseSplashData = true,
    SpellType="Auto",--Green fire override {"Auto","Orange","Green"}
    -- {Display GCD as OffGCD, ForceReturn}
    GCDasOffGCD = {
      -- Abilities
      DemonicPower = true,
      GrimoireOfSacrifice = true,
      DimensionalRift = true,
      SummonImp = true,
      GrimoireImp = true,
    },
    -- {Display OffGCD as OffGCD, ForceReturn}
    OffGCDasOffGCD = {
      -- Abilities
      UnendingResolve = true,
      SoulHarvest = true,
    }
  },]]
  Demonology = {
    ImpsRequiredForImplosion = 8,
    UnendingResolveHP = 20,
    -- {Display GCD as OffGCD, ForceReturn}
    GCDasOffGCD = {
      -- Abilities
      SummonPet = false,
      GrimoireFelguard = false,
      SummonDemonicTyrant = false,
      DemonicStrength = false,
      NetherPortal = true,
      Implosion = false,
    },
    -- {Display OffGCD as OffGCD, ForceReturn}
    OffGCDasOffGCD = {
      -- Abilities
      UnendingResolve = true,
    }
  },
  Affliction = {
    UseSplashData = true,
    -- {Display GCD as OffGCD, ForceReturn}
    GCDasOffGCD = {
      -- Abilities
      DarkSoul = true,
      SummonDarkglare = true,
      SummonPet = false,
      GrimoireOfSacrifice = true,
      PhantomSingularity = true,
    },
    -- {Display OffGCD as OffGCD, ForceReturn}
    OffGCDasOffGCD = {
      -- Abilities
    }
  }
}

HR.GUI.LoadSettingsRecursively(HR.GUISettings)

-- Child Panels
local ARPanel = HR.GUI.Panel
local CP_Warlock = CreateChildPanel(ARPanel, "Warlock")
--local CP_Destruction = CreateChildPanel(CP_Warlock, "Destruction")
local CP_Demonology = CreateChildPanel(CP_Warlock, "Demonology")
local CP_Affliction = CreateChildPanel(CP_Warlock, "Affliction")

-- Warlock
CreateARPanelOptions(CP_Warlock, "APL.Warlock.Commons")

--[[ Destruction
CreatePanelOption("CheckButton", CP_Destruction, "APL.Warlock.Destruction.UseSplashData", "Use Splash Data for AoE", "For AoE purposes, only count enemies previously hit by AoE abilities.")
CreatePanelOption("Slider", CP_Destruction, "APL.Warlock.Destruction.UnendingResolveHP", {0, 100, 1}, "Unending Resolve HP", "Set the Unending Resolve HP threshold.")
CreatePanelOption("Dropdown", CP_Destruction, "APL.Warlock.Destruction.SpellType", {"Auto","Orange","Green"}, "Spell icons", "Define what icons you want to appear.")
CreateARPanelOptions(CP_Destruction, "APL.Warlock.Destruction")]]

-- Demonology
CreatePanelOption("Slider", CP_Demonology, "APL.Warlock.Demonology.ImpsRequiredForImplosion", {3, 12, 1}, "Imps Required for Implodsion", "Set the number of Imps required for Implosion.")
CreatePanelOption("Slider", CP_Demonology, "APL.Warlock.Demonology.UnendingResolveHP", {0, 100, 1}, "Unending Resolve HP", "Set the Unending Resolve HP threshold.")
CreateARPanelOptions(CP_Demonology, "APL.Warlock.Demonology")

-- Affliction
-- CreatePanelOption("CheckButton", CP_Affliction, "APL.Warlock.Affliction.UseSplashData", "Use Splash Data for AoE", "For AoE purposes, only count enemies previously hit by AoE abilities.")
CreateARPanelOptions(CP_Affliction, "APL.Warlock.Affliction")
