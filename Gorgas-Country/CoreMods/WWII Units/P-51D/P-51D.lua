-- Setting up model container
mount_vfs_model_path(current_mod_path .. "/P-51D/Shapes")
mount_vfs_texture_path(current_mod_path .. "/P-51D/Textures/P-51D")
mount_vfs_liveries_path(current_mod_path .. "/P-51D/Liveries")
-- end of Setting up model container



local WOLALIGHT_STROBES         = 1
local WOLALIGHT_SPOTS           = 2
local WOLALIGHT_NAVLIGHTS       = 3
local WOLALIGHT_FORMATION_LIGHTS= 4
local WOLALIGHT_TIPS_LIGHTS     = 5



-- Declaring aircraft
function  make_P_51D ( rewrite_settings )
    local AIRCRAFT = {

        Name                = "P-51D",
        DisplayName         = _("P-51D"),
        date_of_introduction = 1944.0,
        country_of_origin   = "USA",
        Countries = {"Russia", "Ukraine", "Germany", "USA", "Italy", "UK", "Turkey", "Canada", "France", "Spain", "Belgium", "The Netherlands", "Norway", "Denmark", "Gorgas", "Israel", "Australia", "Abkhazia"},

        Picture             = "P-51D.png",
        Rate                = 20, -- RewardPoint in Multiplayer
        Shape               = "P-51D",
        XRayShape           = "P-51D_X-Ray",
        --propellorShapeType  = '3ARG',

        shape_table_data    = {
            {
                file        = "";
                life        = 18; -- life bar
                vis         = 3; -- visibility gain
                desrt       = 'p51-oblomoki'; -- Name of destroyed object file name
                fire        = {300, 2}; -- Fire on the ground after destroyed: 300sec 2m
                username    = "";
                index       = WSTYPE_PLACEHOLDER;
                classname   = "lLandPlane";
                positioning = "BYNORMAL";
                drawonmap = true;
            },
            {
                name = "p51-oblomoki";
                file = "p51-oblomoki";
                fire = {240, 2};
            },
        },
        livery_entry = "P-51D",

        mapclasskey = "P0091000024", -- ref. MissionEditor/data/NewMap/images/themes/nato/P91000024.png
        attribute   = {wsType_Air, wsType_Airplane, wsType_Fighter, P_51D, "Battleplanes",},
        Categories  = {},



        -----------------------------------------------------------------------------------------------



        M_empty         = 3549, -- kg
        M_nominal       = 4000, -- kg
        M_max           = 4800, -- kg
        M_fuel_max      = 732, -- kg
        defFuelRatio    = 0.68, -- топливо по умолчанию в долях от полного
        H_max           = 13000, -- m
        average_fuel_consumption = 0.302, -- this is highly relative, but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s
        CAS_min         = 56, -- if this is not OVERALL FLIGHT TIME, but just LOITER TIME, than it should be 10-15 minutes.....CAS capability in minute (for AI)
        V_opt           = 125,-- Cruise speed (for AI)
        V_take_off      = 53, -- Take off speed in m/s (for AI)
        V_land          = 50, -- Land speed in m/s (for AI)
        V_max_sea_level = 250, -- Max speed at sea level in m/s (for AI)
        V_max_h         = 212, -- Max speed at max altitude in m/s (for AI)
        Vy_max          = 22, -- Max climb speed in m/s (for AI)
        Mach_max        = 0.8, -- Max speed in Mach (for AI)
        Ny_min          = -4.0, -- Min G (for AI)
        Ny_max          = 8.0,  -- Max G (for AI)
        Ny_max_e        = 8.0,  -- Max G (for AI)
        AOA_take_off    = 0.14, -- AoA in take off (for AI)
        bank_angle_max  = 60.0, -- Max bank angle (for AI)

        has_afteburner  = false, -- AFB yes/no
        has_speedbrake  = false, -- Air brake yes/no
        has_differential_stabilizer = false, -- Differential stabilizers yes/no
        flaps_transmission = "Hydraulic",
        undercarriage_transmission = "Hydraulic",
        aim_error_level_bombing = 20.0,
        aim_error_dive_bombing  = 10.0,

        nose_gear_pos                            = {-4.990, -0.920 + 0.100, 0.000}, -- Central gear coordinates
        --nose_gear_amortizer_direct_stroke        = 0.000,
        --nose_gear_amortizer_reversal_stroke      = -0.114,
        --nose_gear_amortizer_normal_weight_stroke = -0.077,
        nose_gear_wheel_diameter                 = 0.319,
        tand_gear_max                            = 0.577, -- tang(a) <- a = steering angle

        main_gear_pos                            = {0.030, -2.100 + 0.150, 1.779}, -- Main gear coordinates
        --main_gear_amortizer_direct_stroke        = 0.000,
        --main_gear_amortizer_reversal_stroke      = -0.1372,
        --main_gear_amortizer_normal_weight_stroke = -0.0533,
        main_gear_wheel_diameter                 = 0.683,

        wing_area       = 22.0, -- Wing area in m2
        wing_span       = 9.12, -- Wing span in metres
        wing_type       = 0, -- 0 = Fixed wing
                             -- 1 = Variable geometry
                             -- 2 = Fold-able wing
        thrust_sum_max  = 8224, -- Thrust in kg (44kN)
        thrust_sum_ab   = 8224, -- Thrust in kg (71kN)
        length          = 12.13, -- Full length in m
        height          = 4.77, -- Height in m
        flaps_maneuver  = 0.5, -- Max flaps in take-off and manoeuvre (0.5 = 1st stage; 1.0 = 2nd stage) (for AI)
        range           = 1015, -- Max range in km (for AI)
        RCS             = 2.5, -- Radar Cross Section m2
        IR_emission_coeff = 0.1, -- Normal engine -- IR_emission_coeff = 1.0 @ Su-27 without afterburner. It is a reference value.
        IR_emission_coeff_ab = 0, -- Same with afterburner
        wing_tip_pos    = {-2.100, 0.000, 5.600}, -- Wing tip coordinates for visual effects
        brakeshute_name = 0, -- Landing - brake chute visual shape after separation

        engines_count = 1, -- Engines count
        engines_nozzles = {
            [1] = {
                pos                 = {1.625499, 0.047866, -0.560}, -- Nozzle coordinates
                elevation           = 0, -- AFB cone elevation
                diameter            = 0 * 0.1, -- AFB cone diameter
                exhaust_length_ab   = -3.0, -- Length in m
                exhaust_length_ab_K = 0.3, -- AB animation
                engine_number       = 1, -- Both to first engine
            }, -- end of [1]
            [2] = {
                pos                 = {1.62499, 0.047866, 0.560}, -- Nozzle coordinates
                elevation           = 0, -- AFB cone elevation
                diameter            = 0 * 0.1, -- AFB cone diameter
                exhaust_length_ab   = -3.0, -- Length in m
                exhaust_length_ab_K = 0.3, -- AB animation
                engine_number       = 1, -- Both to first engine
            }, -- end of [2]
        }, -- end of engines_nozzles

        crew_members = {
            [1] = {
                role                = "pilot";
                pilot_name          = 56,
                ejection_seat_name  = 0,
                drop_canopy_name    = 57,
                pos                 = {-1.460, -0.045, 0.000},
                canopy_pos          = {0.000, 0.000, 0.000},
                drop_parachute_name = "pilot_p51_parachute",
            }, -- end of [1]
        }, -- end of crew_members

        fires_pos = {
            [1]  = {-2.000, 0.595, 0.500};
            [2]  = {0.000, 0.000, 2.237};
            [3]  = {0.000, 0.000, -2.237};
            [4]  = {0.265, 0.000, 1.500};
            [5]  = {-0.265, 0.000, -1.500};
            [6]  = {0.500, 0.000, 4.274};
            [7]  = {0.500, 0.000, -4.274};
            [8]  = {-5.000, 0.500, 0.000};
            [9]  = {-5.000, 0.500, 0.000};
            [10] = {-5.000, 0.500, 0.000};
            [11] = {-5.000, 0.500, 0.000};
        }, -- end of fires_pos

        -- Countermeasures
        SingleChargeTotal   = 0,
        CMDS_Incrementation = 0,
        ChaffDefault        = 0,
        ChaffChargeSize     = 0,
        FlareDefault        = 0,
        FlareChargeSize     = 0,
        CMDS_Edit           = false,

        mechanimations = {
            Door0 = {
                {Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 0.9, "at", 0.11111111111111},},},}, Flags = {"Reversible"},},
                {Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "at", 0.16666666666667},},},}, Flags = {"Reversible", "StepsBackwards"},},
                {Transition = {"Any", "Bailout"}, Sequence = {{C = {{"TearCanopy", 0},},},},},
            },
        },

        net_animation = {
            420,
        },  



        -- Sensors
        detection_range_max     = 0,
        radar_can_see_ground    = false,
        CanopyGeometry = makeAirplaneCanopyGeometry(LOOK_BAD, LOOK_GOOD, LOOK_GOOD),
        Sensors = {
            OPTIC = "Merkury LLTV", -- For night goggles imitation
           -- RWR = "Abstract RWR"
        },



        -- Radio
        HumanRadio = {
            frequency = 124.000,
            editable = true,
            minFrequency = 100.000,
            maxFrequency = 156.000,
            modulation = MODULATION_AM
        },
        -- Mission editor radio panel
        panelRadio = {
            [1] = {  
                name = _("SCR522"),
                range = {min = 100, max = 156},
                channels = {
                    [1] = { name = _("ButtonA"), default = 105, modulation = _("AM"), connect = true},
                    [2] = { name = _("ButtonB"), default = 124, modulation = _("AM")},
                    [3] = { name = _("ButtonC"), default = 131, modulation = _("AM")},
                    [4] = { name = _("ButtonD"), default = 139, modulation = _("AM")},
                }
            },
        },



        -- Guns
        Guns = {
            -- Left wing outboard M2
            BrowningM2({
                muzzle_pos = {-0.045, -0.410, -2.427},
                effect_arg_number = 436,
                mixes = {
                    {2, 2, 2, 2, 2, 2, 2, 4},
                    {2},
                    {4}
                },
                count = 270,
                barrel_circular_error = 0.0024,
                rates = {798},
                azimuth_initial = -0.341,
                elevation_initial = 0.257,
                supply_position = {-0.724, -0.180, -3.000},
                ejector_pos = {-1.055, -0.120, -0.013},
            }),

            -- Left wing middle M2
            BrowningM2({
                muzzle_pos = {-0.035, -0.428, -2.231},
                effect_arg_number = 435,
                mixes = {
                    {2, 4, 2, 2, 2, 2, 2, 2},
                    {2},
                    {4}
                },
                count = 270,
                barrel_circular_error = 0.0024,
                rates = {800},
                azimuth_initial = -0.286,
                elevation_initial = 0.458,
                supply_position = {-0.724, -0.180, -3.000},
                ejector_pos = {-1.055, -0.122, -0.009},
            }),

            -- Left wing inner M2
            BrowningM2({
                muzzle_pos = {-0.028, -0.447, -2.032},
                effect_arg_number = 434,
                mixes = {
                    {2, 2, 4, 2, 2, 2, 2, 2},
                    {2},
                    {4}
                },
                count = 500,
                barrel_circular_error = 0.0024,
                rates = {803},
                azimuth_initial = -0.379,
                elevation_initial = 0.364,
                supply_position = {-0.724, -0.180, -3.000},
                ejector_pos = {-1.055, -0.123, -0.008},
            }),

            -- Right wing inner M2
            BrowningM2({
                muzzle_pos = {-0.028, -0.447, 2.032},
                effect_arg_number = 433,
                mixes = {
                    {2, 2, 2, 4, 2, 2, 2, 2},
                    {2},
                    {4}
                },
                count = 500,
                barrel_circular_error = 0.0024,
                rates = {797},
                azimuth_initial = 0.379,
                elevation_initial = 0.364,
                supply_position = {-0.724, -0.180, 3.000},
                ejector_pos = {-1.055, -0.123, 0.008},
            }),

            -- Right wing middle M2
            BrowningM2({
                muzzle_pos = {-0.035, -0.428, 2.231},
                effect_arg_number = 432,
                mixes = {
                    {2, 2, 2, 2, 4, 2, 2, 2},
                    {2},
                    {4}
                },
                count = 270,
                barrel_circular_error = 0.0024,
                rates = {801},
                azimuth_initial = 0.286,
                elevation_initial = 0.458,
                supply_position = {-0.724, -0.180, 3.000},
                ejector_pos = {-1.055, -0.122, 0.009},
            }),

            -- Right wing outboard M2
            BrowningM2({
                muzzle_pos = {-0.045, -0.41, 2.427},
                effect_arg_number = 350,
                mixes = {
                    {2, 2, 2, 2, 2, 4, 2, 2},
                    {2},
                    {4}
                },
                count = 270,
                barrel_circular_error = 0.0024,
                rates = {804},
                azimuth_initial = 0.341,
                elevation_initial = 0.257,
                supply_position = {-0.724, -0.180, 3.000},
                ejector_pos = {-1.055, -0.120, 0.013},
            }),
        },
        -- Pylons
        Pylons = {
            pylon(
                1, -- pylon index 
                0, -- pylon default weapon start (0 - rail, 1 - catapult, > 1 - from hatch)
                0, 0, 0, -- coordinates in aircraft space, can be 0, 0, 0 if connector is used
                {
                    use_full_connector_position = true,
                    connector = "PYLON_1",
                    arg = 314,
                    arg_value = -1,
                },
                {
                    {
                        CLSID = "{HVAR}",
                        arg_value = 0.5,
                    },
                    {
                        CLSID = "{HVAR_SMOKE_GENERATOR}",
                        arg_value = 0.5,
                    },
                }
            ),
            pylon(
                2, -- pylon index
                0, -- pylon default weapon start (0 - rail, 1 - catapult, > 1 - from hatch)
                0, 0, 0, -- coordinates in aircraft space, can be 0, 0, 0 if connector is used
                {
                    use_full_connector_position = true,
                    connector = "PYLON_2",
                    arg = 313,
                    arg_value = -1,
                },
                {
                    {
                        CLSID = "{HVAR}",
                        arg_value = 0.5,
                    },
                }
            ),
            pylon(
                3, -- pylon index 
                0, -- pylon default weapon start (0 - rail, 1 - catapult, > 1 - from hatch)
                0, 0, 0, -- coordinates in aircraft space, can be 0, 0, 0 if connector is used
                {
                    use_full_connector_position = true,
                    connector = "PYLON_3",
                    arg = 312,
                    arg_value = -1,
                },
                {
                    {
                        CLSID = "{HVAR}",
                        arg_value = 0.5,
                    },
                }
            ),
            pylon(
                4, -- pylon index 
                0, -- pylon default weapon start (0 - rail, 1 - catapult, > 1 - from hatch)
                0, 0, 0, -- coordinates in aircraft space, can be 0, 0, 0 if connector is used
                {
                    use_full_connector_position = true,
                    connector = "PYLON_5",
                    arg = 308,
                    arg_value = -1,
                },
                {
                    {
                        CLSID = "{AN-M64}",
                        arg_value = 0.5,
                        connector = "PYLON_4_B",
                        forbidden = {
                            {station = 5, loadout = {"{HVAR}"}},
                        },
                    },
                    {
                        CLSID = "{DT75GAL}",
                        arg_value = 0.5,
                        connector = "PYLON_4_B",
                        forbidden = {
                            {station = 5, loadout = {"{HVAR}"}},
                        },
                    },
                    {
                        CLSID = "{HVAR}",
                        arg_value = 1.0,
                    },
                }
            ),
            pylon(
                5, -- pylon index 
                0, -- pylon default weapon start (0 - rail, 1 - catapult, > 1 - from hatch)
                0, 0, 0, -- coordinates in aircraft space, can be 0, 0, 0 if connector is used
                {
                    use_full_connector_position = true,
                    connector = "PYLON_6",
                },
                {
                    {
                        CLSID = "{HVAR}",
                        arg = 309,
                        arg_value = 1.0,
                    },
                }
            ),
            pylon(
                6, -- pylon index 
                0, -- pylon default weapon start (0 - rail, 1 - catapult, > 1 - from hatch)
                0, 0, 0, -- coordinates in aircraft space, can be 0, 0, 0 if connector is used
                {
                    use_full_connector_position = true,
                    connector = "PYLON_7",
                },
                {
                    {
                        CLSID = "{HVAR}",
                        arg = 310,
                        arg_value = 1.0,
                    },
                }
            ),
            pylon(
                7, -- pylon index 
                0, -- pylon default weapon start (0 - rail, 1 - catapult, > 1 - from hatch)
                0, 0, 0, -- coordinates in aircraft space, can be 0, 0, 0 if connector is used
                {
                    use_full_connector_position = true,
                    connector = "PYLON_8",
                    arg = 311,
                    arg_value = -1,
                },
                {
                    {
                        CLSID = "{AN-M64}",
                        arg_value = 0.5,
                        connector = "PYLON_9_B",
                        forbidden = {
                            {station = 6, loadout = {"{HVAR}"}},
                        },
                    },
                    {
                        CLSID = "{DT75GAL}",
                        arg_value = 0.5,
                        connector = "PYLON_9_B",
                        forbidden = {
                            {station = 5, loadout = {"{HVAR}"}},
                        },
                    },
                    {
                        CLSID = "{HVAR}",
                        arg_value = 1.0,
                    },
                }
            ),
            pylon(
                8, -- pylon index 
                0, -- pylon default weapon start (0 - rail, 1 - catapult, > 1 - from hatch)
                0, 0, 0, -- coordinates in aircraft space, can be 0, 0, 0 if connector is used
                {
                    use_full_connector_position = true,
                    connector = "PYLON_10",
                    arg = 315,
                    arg_value = -1,
                },
                {
                    {
                        CLSID = "{HVAR}",
                        arg_value = 0.5,
                    },
                }
            ),
            pylon(
                9, -- pylon index 
                0, -- pylon default weapon start (0 - rail, 1 - catapult, > 1 - from hatch)
                0, 0, 0, -- coordinates in aircraft space, can be 0, 0, 0 if connector is used
                {
                    use_full_connector_position = true,
                    connector = "PYLON_11",
                    arg = 316,
                    arg_value = -1,
                },
                {
                    {
                        CLSID = "{HVAR}",
                        arg_value = 0.5,
                    },
                }
            ),
            pylon(
                10, -- pylon index 
                0, -- pylon default weapon start (0 - rail, 1 - catapult, > 1 - from hatch)
                0, 0, 0, -- coordinates in aircraft space, can be 0, 0, 0 if connector is used
                {
                    use_full_connector_position = true,
                    connector = "PYLON_12",
                    arg = 317,
                    arg_value = -1,
                },
                {
                    {
                        CLSID = "{HVAR}",
                        arg_value = 0.5,
                    },
                    {
                        CLSID = "{HVAR_SMOKE_GENERATOR}",
                        arg_value = 0.5,
                    },
                }
            ),
        },



        -- Tasks
        Tasks = {
            aircraft_task(CAP),
            aircraft_task(Escort),
            aircraft_task(FighterSweep),
            aircraft_task(GroundAttack),
            aircraft_task(CAS),
            aircraft_task(AFAC),
            aircraft_task(RunwayAttack),
            aircraft_task(AntishipStrike),
        },
        DefaultTask = aircraft_task(CAS),



        -- SFM Data
        SFM_Data = {
            aerodynamics = { -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
                Cy0         = 0.1, -- zero AoA lift coefficient
                Mzalfa      = 4.355, -- coefficients for pitch agility
                Mzalfadt    = 0.8, -- coefficients for pitch agility
                kjx         = 2.25,
                kjz         = 0.00125,
                Czbe        = -0.016, -- coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system
                cx_gear     = 0.0277, -- coefficient, drag, gear
                cx_flap     = 0.095, -- coefficient, drag, full flaps
                cy_flap     = 0.31, -- coefficient, normal force, lift, flaps
                cx_brk      = 0.06, -- coefficient, drag, breaks
                table_data  = 
                {   --      M       Cx0         Cya         B       B4      Omxmax  Aldop       Cymax
                    {0, 0.0187, 0.0746, 0.052,  0.012,  0.15,   22, 1.45},
                    {0.2,   0.0187, 0.0746, 0.052,  0.012,  0.796144,   22, 1.45},
                    {0.3,   0.0187, 0.0722, 0.052,  0.015,  1.24,   19, 1.2},
                    {0.5,   0.0187, 0.0798, 0.045,  0.025,  1.323,  17, 1.08},
                    {0.59,  0.0187, 0.084,  0.047,  0.026,  1.129077,   17, 1.07},
                    {0.67,  0.0187, 0.0907, 0.047,  0.021,  0.943,  14.5,   0.98},
                    {0.74,  0.0227, 0.0855, 0.08,   0.16,   0.675,  10, 0.72},
                    {0.76,  0.032,  0.078,  0.1,    0.25,   0.577,  9,  0.6},
                    {0.8,   0.063,  0.072,  0.2,    0.36,   0.456,  6,  0.4},
                    {0.83,  0.1,    0.0725, 0.34,   2.4,    0.32,   4.5,    0.3},
                    {0.9,   0.126,  0.073,  0.56,   3,  0.076,  3,  0.2},
                    {1.1,   0.16,   0.03,   0.56,   3,  0.076,  1,  0.3},
                }, -- end of table_data
                -- M - Mach number
                -- Cx0 - Coefficient, drag, profile, of the airplane
                -- Cya - Normal force coefficient of the wing and body of the aircraft in the normal direction to that of flight. Inversely proportional to the available G-loading at any Mach value. (lower the Cya value, higher G available) per 1 degree AOA
                -- B - Polar quad coeff
                -- B4 - Polar 4th power coeff
                -- Omxmax - roll rate, rad/s
                -- Aldop - Alfadop Max AOA at current M - departure threshold
                -- Cymax - Coefficient, lift, maximum possible (ignores other calculations if current Cy > Cymax)
            }, -- end of aerodynamics
            engine = {
                --Nominal_RPM = 3000.0,
                Nmg     = 67.5, -- RPM at idle
                MinRUD  = 0, -- Min state of the throttle
                MaxRUD  = 1, -- Max state of the throttle
                MaksRUD = 1, -- Military power state of the throttle
                ForsRUD = 1, -- Afterburner state of the throttle
                type    = "Piston",

                hMaxEng = 12.5, -- Max altitude for safe engine operation in km
                dcx_eng = 0.0015, -- Engine drag coefficient
                cemax   = 0.37, -- not used for fuel calculation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
                cefor   = 0.37, -- not used for fuel calculation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
                dpdh_m  = 1800, -- altitude coefficient for max thrust
                dpdh_f  = 1800, -- altitude coefficient for AB thrust
                k_adiab_1           = 0.037923,
                k_adiab_2           = 0.0562,
                MAX_Manifold_P_1    = 155774,
                MAX_Manifold_P_2    = 206570,
                MAX_Manifold_P_3    = 226648,
                k_after_cool        = 0.54,
                Displ               = 27,
                k_Eps               = 6,
                Stroke              = 0.152,
                V_pist_0            = 12,
                Nu_0                = 1.2,
                Nu_1                = 0.9,
                Nu_2                = 0.001,
                N_indic_0           = 1023040,
                N_fr_0              = 0.072,
                N_fr_1              = 0.02,
                Init_Mom            = 220,
                D_prop              = 3.45,
                MOI_prop            = 65,
                k_gearbox           = 2.088,
                P_oil               = 495438,
                k_boost             = 3,
                k_cfug              = 0.003,
                k_oil               = 0.00004,
                k_piston            = 3000,
                k_reg               = 0.003,
                k_vel               = 0.017,
                table_data = 
                {
                --   M          Pmax
                    {0.0,       16620.0},
                    {0.1,       15600.0},
                    {0.2,       14340.0},
                    {0.3,       13320.0},
                    {0.4,       12230.0},
                    {0.5,       11300.0},
                    {0.6,       10600.0},
                    {0.7,       10050.0},
                    {0.8,        9820.0},
                    {0.9,        5902.0},
                    {1.9,        3469.0}
                },
                -- M - Mach number
                -- Pmax - Engine thrust at military power
                -- Pfor - Engine thrust at AFB
                --cylinder_firing_order = {1,3,4,2},
            }, -- end of engine
        },



        -- Damage, index meaning see in Scripts\Aircrafts\_Common\Damage.lua
        Damage = verbose_to_dmg_properties({
            -- Fuselage
            ["FUSELAGE_BOTTOM"] = {
                critical_damage = 5,
                args = {152},
            },
            ["COCKPIT"] = {
                critical_damage = 3,
                args = {296},
            },
            ["CABIN_LEFT_SIDE"] = {
                critical_damage = 5,
                args = {154},
            },
            ["CABIN_RIGHT_SIDE"] = {
                critical_damage = 5,
                args = {153},
            },
            --

            -- Nose
            ["ENGINE"] = {
                critical_damage = 3,
                args = {147},
            },
            ["ROTOR"] = {
                critical_damage = 6,
                args = {53},
                children = {"BLADE_1_OUT", "BLADE_2_OUT", "BLADE_3_OUT", "BLADE_4_OUT"},
            },
            ["BLADE_1_IN"] = {
                critical_damage = 3,
                args = {429},
            },
            ["BLADE_1_OUT"] = {
                critical_damage = 3,
                args = {270},
            },
            ["BLADE_2_IN"] = {
                critical_damage = 3,
                args = {430},
            },
            ["BLADE_2_OUT"] = {
                critical_damage = 3,
                args = {271},
            },
            ["BLADE_3_IN"] = {
                critical_damage = 3,
                args = {431},
            },
            ["BLADE_3_OUT"] = {
                critical_damage = 3,
                args = {272},
            },
            ["BLADE_4_IN"] = {
                critical_damage = 3,
                args = {119},
            },
            ["BLADE_4_OUT"] = {
                critical_damage = 3,
                args = {273},
            },
            ["NOSE_LEFT_SIDE"] = {
                critical_damage = 5,
                args = {150},
            },
            ["NOSE_RIGHT_SIDE"] = {
                critical_damage = 5,
                args = {149},
            },
            ["NOSE_BOTTOM"] = {
                critical_damage = 5,
                args = {148},
            },
            --

            -- Tail less Sporn
            ["TAIL_LEFT_SIDE"] = {
                critical_damage = 5,
                args = {158},
            },
            ["TAIL_RIGHT_SIDE"] = {
                critical_damage = 5,
                args = {157},
            },
            ["TAIL"] = {
                critical_damage = 7,
                args = {81},
                children = {"FIN_L_BOTTOM", "RUDDER_R", "STABILIZER_L_OUT", "STABILIZER_R_OUT"},
            },
            --

            -- Keel & Rudder
            ["FIN_L_BOTTOM"] = {
                critical_damage = 6,
                args = {243},
                children = {"FIN_L_CENTER", "FIN_L_TOP", "RUDDER", "STABILIZER_L_OUT", "STABILIZER_R_OUT", "ELEVATOR_L_OUT", "ELEVATOR_R_OUT"},
            },
            ["FIN_L_CENTER"] = {
                critical_damage = 4,
                args = {242},
            },
            ["FIN_L_TOP"] = {
                critical_damage = 4,
                args = {242},
            },
            ["RUDDER"] = {
                critical_damage = 3,
                args = {247},
            },
            --

            -- Stabilizers & Elevators
            ["STABILIZER_L_IN"] = {
                critical_damage = 6,
                args = {236},
                children = {"ELEVATOR_L_OUT"},
            },
            ["STABILIZER_L_OUT"] = {
                critical_damage = 4,
                args = {235},
            },
            ["ELEVATOR_L_OUT"] = {
                critical_damage = 3,
                args = {240},
            },
            ["STABILIZER_R_IN"] = {
                critical_damage = 6,
                args = {234},
                children = {"ELEVATOR_R_OUT"},
            },
            ["STABILIZER_R_OUT"] = {
                critical_damage = 4,
                args = {233},
            },
            ["ELEVATOR_R_OUT"] = {
                critical_damage = 3,
                args = {238},
            },
            --

            -- Left Wing
            ["WING_L_IN"] = {
                critical_damage = 7,
                args = {225},
                children = {"WING_L_CENTER", "WING_L_OUT", "AILERON_L", "FLAP_L_IN"},
            },
            ["WING_L_CENTER"] = {
                critical_damage = 7,
                args = {224},
                children = {"WING_L_OUT", "AILERON_L", "FLAP_L_IN"},
            },
            ["WING_L_OUT"] = {
                critical_damage = 7,
                args = {223},
                children = {"AILERON_L"},
            },
            ["AILERON_L"] = {
                critical_damage = 3,
                args = {226},
            },
            ["FLAP_L_IN"] = {
                critical_damage = 4,
                args = {227},
            },
            --

            -- Right Wing
            ["WING_R_IN"] = {
                critical_damage = 7,
                args = {215},
                children = {"WING_R_CENTER", "WING_R_OUT", "AILERON_R", "FLAP_R_IN"},
            },
            ["WING_R_CENTER"] = {
                critical_damage = 7,
                args = {214},
                children = {"WING_R_OUT", "AILERON_R", "FLAP_R_IN"},
            },
            ["WING_R_OUT"] = {
                critical_damage = 7,
                args = {213},
                children = {"AILERON_R"},
            },
            ["AILERON_R"] = {
                critical_damage = 3,
                args = {216},
            },
            ["FLAP_R_IN"] = {
                critical_damage = 4,
                args = {217},
            },
            --

            -- Undercarriage
            ["WHEEL_REAR"] = {
                critical_damage = 2,
                args = {134},
            },
            ["WHEEL_R"] = {
                critical_damage = 3,
                args = {135},
            },
            ["WHEEL_L"] = {
                critical_damage = 3,
                args = {136},
            },
            --
        }),

        -- Damage, index meaning see in Scripts\Aircrafts\_Common\Damage.lua
        Damage = verbose_to_dmg_properties({
            -- Fuselage
            ["FUSELAGE_BOTTOM"] = {
                critical_damage = 5, args = {152},
                construction = {durability = 3.208, skin = "Aluminum"},
                droppable = false,
                children = {"NOSE_BOTTOM", "CABIN_LEFT_SIDE", "CABIN_RIGHT_SIDE", "COCKPIT"},
                innards = {
                    {id = "XEng0OilRadiator", skin = "Steel", wall = 0.002},
                    {id = "XEng0OilHose0", skin = "Rubber", wall = 0.012},
                    {id = "XEng0WaterRadiator", skin = "Steel", wall = 0.002},
                },
            },
            ["COCKPIT"] = {
                critical_damage = 3, args = {296},
                construction = {durability = 0.840, skin = "Glass", spar = "Truss"},
                detachable = {shape = "P-51D-Fonar"},
                innards = {
                    {id = "XArmor01", skin = "Steel", wall = 0.022},
                },
            },
            ["CABIN_LEFT_SIDE"] = {
                critical_damage = 5, args = {154},
                construction = {durability = 2.809, skin = "Aluminum"},
                children = {"NOSE_LEFT_SIDE", "TAIL_LEFT_SIDE", "WING_L_IN"},
                innards = {
                    {id = "XCrew0"},
                    {id = "XCrew0H"},
                    {id = "XCtrlEng0Quadrant", skin = "Steel", wall = 0.006},
                    {id = "XCockpitElement01", skin = "Steel", wall = 0.001,
                        failures = {
                            {"K14_NO_POWER_SUPPLY",      0.3},
                            {"K14_FIXED_LAMP_DEFECTIVE", 0.3},
                            {"K14_MOV_LAMP_DEFECTIVE",   0.3},
                            {"K14_MOTOR_DEFECTIVE",      0.3},
                        },
                    },
                    {id = "XCockpitElement02", skin = "Steel", wall = 0.001,
                        failures = {
                            {"ELEC_DASHBOARD_HARNESS_CUT", 0.01},
                            {"ELEC_PITOT_HEAT_WIRING", 0.03},
                            {"ELEC_STARTER_LOOM_SEVERED", 0.03},
                            {"BOOSTER_COIL", 0.03},
                            {"TACH_BREAK_CIRCUIT", 0.03},
                            {"TACH_BREAK_IN_INDICATOR", 0.03},
                            {"TACH_POOR_CONNECTION", 0.03},
                            {"TACH_RESISTANCE_ADJ", 0.03},
                            {"OIL_DILUTION_WIRE", 0.03},
                            {"DEFECTIVE_INSTRUMENT", 0.03},
                            {"DEFECTIVE_MECHANISM", 0.03},
                            {"MANIFOLD_SHIFT", 0.03},
                            {"MANIFOLD_LINE_LEAK", 0.03},
                        },
                    },
                    {id = "XArmor02", skin = "ReinforcedGlass", wall = 0.075},
                    {id = "XArmor00", skin = "Steel", wall = 0.022},
                    {id = "XCtrlCrew0Stick", skin = "Steel", wall = 0.044},
                    {id = "XCtrlLineEng0", skin = "Steel", wall = 0.006},
                    {id = "XArmor03", skin = "Steel", wall = 0.012},
                },
            },
            ["CABIN_RIGHT_SIDE"] = {
                critical_damage = 5, args = {153},
                construction = {durability = 2.809, skin = "Aluminum"},
                children = {"NOSE_RIGHT_SIDE", "TAIL_RIGHT_SIDE", "WING_R_IN"},
                innards = {
                    {id = "XElecIFF", skin = "Steel", wall = 0.001},
                    {id = "XHydroQuadrant", skin = "Steel", wall = 0.034},
                    {id = "XOxygenHose", skin = "Rubber", wall = 0.055},
                    {id = "XOxygenHose0", skin = "Rubber", wall = 0.055},
                    {id = "XOxygenHose1", skin = "Rubber", wall = 0.055},
                    {id = "XOxygenCrew0Gear", skin = "Steel", wall = 0.008},
                },
            },
            --

            -- Nose
            ["ENGINE"] = {
                critical_damage = 3, args = {147},
                construction = {durability = 1.671, skin = "Aluminum", spar = "Truss"},
                detachable = {shape = "P-51D-Fonar"}, -- TODO implement
            },
            ["ROTOR"] = {
                critical_damage = 6, args = {53},
                construction = {durability = 0.25, skin = "Aluminum"},
                children = {"BLADE_1_IN", "BLADE_1_OUT", "BLADE_2_IN", "BLADE_2_OUT", "BLADE_3_IN", "BLADE_3_OUT", "BLADE_4_IN", "BLADE_4_OUT"},
            },
            ["BLADE_1_IN"] = {
                critical_damage = 3, args = {429},
                construction = {durability = 0.11, skin = "Aluminum"},
            },
            ["BLADE_1_OUT"] = {
                critical_damage = 3, args = {270},
                construction = {durability = 0.11, skin = "Aluminum"},
            },
            ["BLADE_2_IN"] = {
                critical_damage = 3, args = {430},
                construction = {durability = 0.11, skin = "Aluminum"},
            },
            ["BLADE_2_OUT"] = {
                critical_damage = 3, args = {271},
                construction = {durability = 0.11, skin = "Aluminum"},
            },
            ["BLADE_3_IN"] = {
                critical_damage = 3, args = {431},
                construction = {durability = 0.11, skin = "Aluminum"},
            },
            ["BLADE_3_OUT"] = {
                critical_damage = 3, args = {272},
                construction = {durability = 0.11, skin = "Aluminum"},
            },
            ["BLADE_4_IN"] = {
                critical_damage = 3, args = {119},
                construction = {durability = 0.11, skin = "Aluminum"},
            },
            ["BLADE_4_OUT"] = {
                critical_damage = 3, args = {273},
                construction = {durability = 0.11, skin = "Aluminum"},
            },
            ["NOSE_LEFT_SIDE"] = {
                critical_damage = 5, args = {150},
                construction = {durability = 2.627, skin = "Aluminum"},
            },
            ["NOSE_RIGHT_SIDE"] = {
                critical_damage = 5, args = {149},
                construction = {durability = 2.627, skin = "Aluminum"},
            },
            ["NOSE_BOTTOM"] = {
                critical_damage = 5, args = {148},
                construction = {durability = 2.468, skin = "Aluminum"},
                children = {"ROTOR", "ENGINE"},
                innards = {
                    {id = "XEng0Case", skin = "CastIron", wall = 0.022},
                    {id = "XEng0HeadsLH", skin = "CastIron", wall = 0.056},
                    {id = "XEng0HeadsRH", skin = "CastIron", wall = 0.056},
                    {id = "XEng0Magneto0", skin = "Plastic", wall = 0.010},
                    {id = "XEng0Magneto1", skin = "Plastic", wall = 0.010},
                    {id = "XEng0PropGear", skin = "Steel", wall = 0.012},
                    {id = "XEng0Supercharger", skin = "Steel", wall = 0.004},
                    {id = "XEng0Intercooler", skin = "Steel", wall = 0.002},
                    {id = "XEng0FuelPump", skin = "Steel", wall = 0.012},
                    {id = "XEng0Intake", skin = "Aluminum", wall = 0.002},
                    {id = "XHydroTank", skin = "Plastic", wall = 0.006},
                    {id = "XHydroHose", skin = "Rubber", wall = 0.004},
                    {id = "XHydroHoseWBrake", skin = "Rubber", wall = 0.004},
                    {id = "XHydroPump0", skin = "Steel", wall = 0.035},
                    {id = "XElecGenerator", skin = "Steel", wall = 0.010},
                    {id = "XEng0Governor", skin = "Steel", spar = "HeavySprocket", wall = 0.012},
                    {id = "XEng0OilTank", skin = "Steel", wall = 0.003},
                    {id = "XEng0OilPump", skin = "Steel", wall = 0.005},
                    {id = "XEng0WaterTank", skin = "Plastic", wall = 0.012},
                    {id = "XEng0WaterHose0", skin = "Rubber", wall = 0.010},
                    {id = "XEng0WaterHose1", skin = "Rubber", wall = 0.010},
                    {id = "XElecEng0Starter", skin = "Steel", wall = 0.032},
                    {id = "XEng0Carburettor", skin = "Steel", wall = 0.014},
                },
            },
            --

            -- Tail less Sporn
            ["TAIL_LEFT_SIDE"] = {
                critical_damage = 5, args = {158},
                construction = {durability = 1.353, skin = "Aluminum"},
                children = {"TAIL"},
                innards = {
                    {id = "XElecBattery", skin = "Plastic", wall = 0.010},
                    {id = "XElecRadio", skin = "Plastic", wall = 0.062},
                    {id = "XFuelTank3", skin = "Rubber", wall = 0.036, specific = "SelfSealing",
                        failures = {
                            {"ELEC_BOOSTER_FUEL_PUMP_2_FAILURE", 0.01},
                        },
                    },
                    {id = "XFuelBoosterPump2", skin = "Steel", wall = 0.001},
                    {id = "XFuelLine3", skin = "Rubber", wall = 0.014},
                    {id = "XFuelLine4", skin = "Rubber", wall = 0.014},
                    {id = "XHydroFlapsJack", skin = "Steel", wall = 0.004},
                    {id = "XCtrlLineFlaps", skin = "Steel", wall = 0.004},
                },
            },
            ["TAIL_RIGHT_SIDE"] = {
                critical_damage = 5, args = {157},
                construction = {durability = 1.353, skin = "Aluminum"},
            },
            ["TAIL"] = {
                critical_damage = 7, args = {81},
                construction = {durability = 1.550, skin = "Aluminum"},
                detachable = {shape = "p51-oblomok_tail"},
                children = {"FIN_L_BOTTOM", "STABILIZER_L_IN", "STABILIZER_R_IN", "WHEEL_REAR"},
                innards = {
                    {id = "XCtrlLineRudder", skin = "Steel", wall = 0.004},
                    {id = "XCtrlLineElevator", skin = "Steel", wall = 0.004},
                    {id = "XOxygenTank", skin = "CastIron", wall = 0.012,
                        failures = {
                            {"F2_TOP_CYLINDER", 0.25},
                            {"F2_BOTTOM_CYLINDER", 0.25},
                            {"D2_LEFT_CYLINDER", 0.25},
                            {"D2_RIGHT_CYLINDER", 0.25},
                        },
                    },
                },
            },
            --

            -- Keel & Rudder
            ["FIN_L_BOTTOM"] = {
                critical_damage = 6, args = {243},
                construction = {durability = 0.444, skin = "Aluminum", spar = "FlangeBeam"},
                detachable = {shape = "p51-oblomok_tail"},
                children = {"FIN_L_CENTER"},
            },
            ["FIN_L_CENTER"] = {
                critical_damage = 4, args = {242},
                construction = {durability = 0.234, skin = "Aluminum", spar = "FlangeBeam"},
                detachable = {shape = "p51-oblomok_tail"},
                children = {"FIN_L_TOP"},
                innards = {
                    {id = "XSparKeelIn", skin = "Steel", wall = 0.005},
                },
            },
            ["FIN_L_TOP"] = {
                critical_damage = 4, args = {242},
                construction = {durability = 0.268, skin = "Aluminum", spar = "FlangeBeam"},
                detachable = {shape = "p51-oblomok_tail"},
                children = {"RUDDER"},
                innards = {
                    {id = "XSparKeelOut", skin = "Steel", wall = 0.005},
                },
            },
            ["RUDDER"] = {
                critical_damage = 3, args = {247},
                construction = {durability = 0.97, skin = "Aluminum", spar = "Truss"},
                detachable = {shape = "p51-oblomok_tail"},
                innards = {
                    {id = "XElecElement02", skin = "Glass", wall = 0.004,
                        failures = {
                            {"ELEC_NAVLIGHT_WHITE_FAILURE", 1.0},
                        },
                    },
                    {id = "XJointR", skin = "Steel", wall = 0.015, count = 2},
                },
            },
            --

            -- Stabilizers & Elevators
            ["STABILIZER_L_IN"] = {
                critical_damage = 6, args = {236},
                construction = {durability = 0.594, skin = "Aluminum", spar = "FlangeBeam"},
                detachable = {shape = "p51-oblomok_tail"},
                children = {"STABILIZER_L_OUT"},
                innards = {
                    {id = "XSparStabLHIn", skin = "Steel", wall = 0.005},
                },
            },
            ["STABILIZER_L_OUT"] = {
                critical_damage = 4, args = {235},
                construction = {durability = 0.453, skin = "Aluminum", spar = "FlangeBeam"},
                detachable = {shape = "p51-oblomok_tail"},
                children = {"ELEVATOR_L_OUT"},
                innards = {
                    {id = "XSparStabLHOut", skin = "Steel", wall = 0.005},
                },
            },
            ["ELEVATOR_L_OUT"] = {
                critical_damage = 3, args = {240},
                construction = {durability = 0.605, skin = "Aluminum", spar = "Truss"},
                detachable = {shape = "p51-oblomok_tail"},
                innards = {
                    {id = "XJointELH", skin = "Steel", wall = 0.015, count = 2},
                },
            },
            ["STABILIZER_R_IN"] = {
                critical_damage = 6, args = {234},
                construction = {durability = 0.594, skin = "Aluminum", spar = "FlangeBeam"},
                detachable = {shape = "p51-oblomok_tail"},
                children = {"STABILIZER_R_OUT"},
                innards = {
                    {id = "XSparStabRHIn", skin = "Steel", wall = 0.005},
                },
            },
            ["STABILIZER_R_OUT"] = {
                critical_damage = 4, args = {233},
                construction = {durability = 0.453, skin = "Aluminum", spar = "FlangeBeam"},
                detachable = {shape = "p51-oblomok_tail"},
                children = {"ELEVATOR_R_OUT"},
                innards = {
                    {id = "XSparStabRHOut", skin = "Steel", wall = 0.005},
                },
            },
            ["ELEVATOR_R_OUT"] = {
                critical_damage = 3, args = {238},
                construction = {durability = 0.605, skin = "Aluminum", spar = "Truss"},
                detachable = {shape = "p51-oblomok_tail"},
                innards = {
                    {id = "XJointERH", skin = "Steel", wall = 0.015, count = 2},
                },
            },
            --

            -- Left Wing
            ["WING_L_IN"] = {
                critical_damage = 7, args = {225},
                construction = {durability = 3.42, skin = "Aluminum", spar = "FlangeBeam", count = 2},
                detachable = {shape = "p51-oblomok-wing-l"},
                children = {"WING_L_CENTER", "WHEEL_L"},
                innards = {
                    {id = "XUCLockLHU", skin = "Steel", wall = 0.009},
                    {id = "XSparWLHIn", skin = "Steel", wall = 0.015},
                    {id = "XHydroGearJackLH", skin = "Steel", wall = 0.004},
                    {id = "XFuelTank0", skin = "Rubber", wall = 0.036, specific = "SelfSealing"},
                    {id = "XFuelBoosterPump0", skin = "Steel", wall = 0.001},
                    {id = "XFuelLine0", skin = "Rubber", wall = 0.014},
                    {id = "XHydroHoseWBrakeLH", skin = "Rubber", wall = 0.004},
                    {id = "XCtrlLineFlapsLH", skin = "Steel", wall = 0.004},
                },
            },
            ["WING_L_CENTER"] = {
                critical_damage = 7, args = {224},
                construction = {durability = 3.46, skin = "Aluminum", spar = "FlangeBeam", count = 2},
                detachable = {shape = "p51-oblomok-wing-l"},
                children = {"WING_L_OUT", "FLAP_L_IN"},
                innards = {
                    {id = "XGun-100", skin = "Steel", wall = 0.006},
                    {id = "XGun-101", skin = "Steel", wall = 0.006},
                    {id = "XGun-102", skin = "Steel", wall = 0.006},
                    {id = "XSparWLHMid", skin = "Steel", wall = 0.015},
                    {id = "XAmmoBox-100", skin = "Aluminum", wall = 0.006,
                        failures = {
                            {"WEAP_GUN_00_AMMO_BELT_SEVERED", 0.11},
                            {"WEAP_GUN_01_AMMO_BELT_SEVERED", 0.11},
                            {"WEAP_GUN_02_AMMO_BELT_SEVERED", 0.11},
                        },
                    },
                },
            },
            ["WING_L_OUT"] = {
                critical_damage = 7, args = {223},
                construction = {durability = 2.83, skin = "Aluminum", spar = "FlangeBeam", count = 2},
                detachable = {shape = "p51-oblomok-wing-l"},
                children = {"AILERON_L"},
                innards = {
                    {id = "XCtrlLineAileronLH", skin = "Steel", wall = 0.002},
                    {id = "XSparWLHOut", skin = "Steel", wall = 0.015},
                    {id = "XElecElement00", skin = "Glass", wall = 0.004,
                        failures = {
                            {"ELEC_NAVLIGHT_RED_FAILURE", 1.0},
                        },
                    },
                },
            },
            ["AILERON_L"] = {
                critical_damage = 3, args = {226},
                construction = {durability = 0.625, skin = "Aluminum", spar = "Truss"},
                detachable = {shape = "p51-oblomok-wing-l"},
                innards = {
                    {id = "XJointALH", skin = "Steel", wall = 0.015, count = 2},
                },
            },
            ["FLAP_L_IN"] = {
                critical_damage = 4, args = {227},
                construction = {durability = 1.2, skin = "Aluminum", spar = "Truss"},
                detachable = {shape = "p51-oblomok-wing-l"},
                innards = {
                    {id = "XJointFlapLH", skin = "Steel", wall = 0.015, count = 2},
                },
            },
            --

            -- Right Wing
            ["WING_R_IN"] = {
                critical_damage = 7, args = {215},
                construction = {durability = 3.42, skin = "Aluminum", spar = "FlangeBeam", count = 2},
                detachable = {shape = "p51-oblomok-wing-r"},
                children = {"WING_R_CENTER", "WHEEL_R"},
                innards = {
                    {id = "XUCLockRHU", skin = "Steel", wall = 0.009},
                    {id = "XSparWRHIn", skin = "Steel", wall = 0.015},
                    {id = "XHydroGearJackRH", skin = "Steel", wall = 0.004},
                    {id = "XFuelTank1", skin = "Rubber", wall = 0.036, specific = "SelfSealing"},
                    {id = "XFuelBoosterPump1", skin = "Steel", wall = 0.001},
                    {id = "XFuelLine1", skin = "Rubber", wall = 0.014},
                    {id = "XHydroHoseWBrakeRH", skin = "Rubber", wall = 0.004},
                    {id = "XCtrlLineFlapsRH", skin = "Steel", wall = 0.004},
                },
            },
            ["WING_R_CENTER"] = {
                critical_damage = 7, args = {214},
                construction = {durability = 3.46, skin = "Aluminum", spar = "FlangeBeam", count = 2},
                detachable = {shape = "p51-oblomok-wing-r"},
                children = {"WING_R_OUT", "FLAP_R_IN"},
                innards = {
                    {id = "XGun-103", skin = "Steel", wall = 0.006},
                    {id = "XGun-104", skin = "Steel", wall = 0.006},
                    {id = "XGun-105", skin = "Steel", wall = 0.006},
                    {id = "XSparWRHMid", skin = "Steel", wall = 0.015},
                    {id = "XAmmoBox-101", skin = "Aluminum", wall = 0.006,
                        failures = {
                            {"WEAP_GUN_03_AMMO_BELT_SEVERED", 0.11},
                            {"WEAP_GUN_04_AMMO_BELT_SEVERED", 0.11},
                            {"WEAP_GUN_05_AMMO_BELT_SEVERED", 0.11},
                        },
                    },
                },
            },
            ["WING_R_OUT"] = {
                critical_damage = 7, args = {213},
                construction = {durability = 2.83, skin = "Aluminum", spar = "FlangeBeam", count = 2},
                detachable = {shape = "p51-oblomok-wing-r"},
                children = {"AILERON_R"},
                innards = {
                    {id = "XCtrlLineAileronRH", skin = "Steel", wall = 0.002},
                    {id = "XSparWRHOut", skin = "Steel", wall = 0.015},
                    {id = "XElecElement01", skin = "Glass", wall = 0.004,
                        failures = {
                            {"ELEC_NAVLIGHT_GREEN_FAILURE", 1.0},
                        },
                    },
                },
            },
            ["AILERON_R"] = {
                critical_damage = 3, args = {216},
                construction = {durability = 0.625, skin = "Aluminum", spar = "Truss"},
                detachable = {shape = "p51-oblomok-wing-r"},
                innards = {
                    {id = "XJointARH", skin = "Steel", wall = 0.015, count = 2},
                },
            },
            ["FLAP_R_IN"] = {
                critical_damage = 4, args = {217},
                construction = {durability = 1.2, skin = "Aluminum", spar = "Truss"},
                detachable = {shape = "p51-oblomok-wing-r"},
                innards = {
                    {id = "XJointFlapRH", skin = "Steel", wall = 0.015, count = 2},
                },
            },
            --

            -- Undercarriage
            ["WHEEL_REAR"] = {
                critical_damage = 2, args = {134},
                construction = {durability = 1.0, skin = "Rubber"},
                innards = {
                    {id = "XUCShockC", skin = "Steel", wall = 0.010},
                },
            },
            ["WHEEL_R"] = {
                critical_damage = 3, args = {135},
                construction = {durability = 1.0, skin = "Rubber"},
                innards = {
                    {id = "XUCShockRH", skin = "Steel", wall = 0.009},
                },
            },
            ["WHEEL_L"] = {
                critical_damage = 3, args = {136},
                construction = {durability = 1.0, skin = "Rubber"},
                innards = {
                    {id = "XUCShockLH", skin = "Steel", wall = 0.009},
                },
            },
            --
        }),

        DamageParts = {
            [1] = "p51-oblomok-wing-r", -- wing R
            [2] = "p51-oblomok-wing-l", -- wing L
            [3] = "p51-oblomok_nose", -- nose
            [4] = "p51-oblomok_tail", -- tail
        },



        --[[AddPropAircraft = {
        },]]--



        Failures = {
            { id = 'HORIZON_BAR_NOT_SETTLE',                label = _('Artificial Horizon'),                                enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TURNIND_POINTER_FAILS_NO_VACUUM',       label = _('Turn ind. No vac.'),                                 enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TURNIND_POINTER_FAILS_DEFECTIVE',       label = _('Turn ind. defective'),                               enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TURNIND_INCORRECT_SENS_DEFECTIVE',      label = _('Turn ind. Incorrect  sens.'),                        enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TURNIND_INCORRECT_SENS_VAC_HIGH',       label = _('Turn ind. Vacuum high'),                             enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TURNIND_INCORRECT_SENS_VAC_LOW',        label = _('Turn ind. Vacuum low'),                              enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TURNIND_POINTER_NOT_SET_ZERO',          label = _('Turn ind. Pointer does not set on 0(N/F)'),          enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TURNIND_POINTER_VIBRATES',              label = _('Turn ind. Pointer vibrates(N/F)'),                   enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'PUMP_SEPARATOR_CLOGGED',                label = _('Vacuum pump separator clogged'),                     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'PUMP_RELIEF_VALVE_SCREEN_CLOGGED',      label = _('Vacuum valve screen clogged'),                       enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'PUMP_RELIEF_VALVE_LEAKS',               label = _('Vacuum relief valve leaks'),                         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'PUMP_FAILS',                            label = _('Vacuum pump fails'),                                 enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'MANIFOLD_SHIFT',                        label = _('Manifold pressure ind. pointer shifted'),            enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'MANIFOLD_LINE_LEAK',                    label = _('Manifold pressure ind. line leak'),                  enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'COOLANT_RADIATOR_WIRING',               label = _('Coolant radiator flap. No volt.'),                   enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'COOLANT_RADIATOR_MOTOR',                label = _('Coolant radiator flap. Motor fault.'),               enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'COOLANT_RADIATOR_SENSOR',               label = _('Coolant radiator sensor fault.'),                    enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'OIL_RADIATOR_WIRING',                   label = _('Oil radiator flap. No volt.'),                       enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'OIL_RADIATOR_MOTOR',                    label = _('Oil radiator flap. Motor fault.'),                   enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'OIL_RADIATOR_SENSOR',                   label = _('Oil radiator sensor fault.'),                        enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'OIL_LEAK',                              label = _('Oil Leak.'),                                         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'COMPASS_NO_TORQUE',                     label = _('Remote Compass. No torque'),                         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'COMPASS_ERRATIC_OPERATION',             label = _('Remote Compass. Erratic operation'),                 enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'COMPASS_POINTER_PULLS',                 label = _('Remote Compass. Pointer pulls'),                     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'COMPASS_ERRATIC_INDIACATON',            label = _('Remote Compass. Loose pointer'),                     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'DEFECTIVE_INSTRUMENT',                  label = _('Directional gyro fail'),                             enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'DEFECTIVE_MECHANISM',                   label = _('Directional gyro mechanism fail'),                   enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'ELEC_PITOT_HEAT_WIRING',                label = _('Pitot heating wire broken'),                         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ELEC_PITOT_HEAT_ELEMENT',               label = _('Pitot heating element burned out'),                  enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'BAT_SOLENOID_WIRING',                   label = _('Bat. solenoid wiring fault'),                        enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'BAT_SOLENOID_DEFECTIVE',                label = _('Bat. solenoid defective'),                           enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'SUPERCHARGER_LIGHT',                    label = _('Supercharger light fault'),                          enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'SUPERCHARGER_WIRE',                     label = _('Supercharger wiring fault'),                         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'SUPERCHARGER_SOLENOID',                 label = _('Supercharger solenoid fault'),                       enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'OIL_DILUTION_SOLENOID',                 label = _('Oil dilution solenoid fault'),                       enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'OIL_DILUTION_WIRE',                     label = _('Oil dilution wiring fault'),                         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'TACH_BREAK_CIRCUIT',                    label = _('Tachometer circuit break'),                          enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TACH_BREAK_IN_INDICATOR',               label = _('Tachometer indicator break'),                        enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TACH_POOR_CONNECTION',                  label = _('Tachometer poor connection'),                        enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TACH_RESISTANCE_ADJ',                   label = _('Tachometer indicator adjustment fault'),             enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'VHF_CRYSTAL',                           label = _('Radio. Crystal or tube failure'),                    enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'VHF_SHORTED_CTL_BOX',                   label = _('Radio. Shorted control box'),                        enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'VHF_VT_BURNED_OUT',                     label = _('Radio. Receiver burned out'),                        enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'VHF_VT207_DEFECTIVE',                   label = _('Radio. Squelch tube burned out'),                    enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'VHF_SQUELCH_RELAY',                     label = _('Radio. Squelch relay not working'),                  enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'F2_TOP_CYLINDER',                       label = _('Top oxygen cylinder leakage'),                       enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'F2_BOTTOM_CYLINDER',                    label = _('Bottom oxygen cylinder leakage'),                    enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'D2_LEFT_CYLINDER',                      label = _('Left oxygen cylinder leakage'),                      enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'D2_RIGHT_CYLINDER',                     label = _('Right oxygen cylinder leakage'),                     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'COOLANT_BREAK_BULB',                    label = _('Coolant temp. ind. bulb fault'),                     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'COOLANT_DEFECTIVE_IND',                 label = _('Coolant temp. ind. defective'),                      enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'COOLANT_POOR_CONNTECT',                 label = _('Coolant temp. ind. poor connection'),                enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'COOLANT_SHORT_CIRCUIT',                 label = _('Coolant temp. ind. short circuit'),                  enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'CARBAIR_SHORT_CIRCUIT',                 label = _('Carb. air ind. open or short circuit'),              enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'CARBAIR_SHORT_CIRCUIT_LEADS',           label = _('Carb. air ind. short circuit in leads'),             enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'CARBAIR_GND_LEAD',                      label = _('Carb. air ind. gnd in leads'),                       enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'CARBAIR_SHORT_CIRCUIT_BLB',             label = _('Carb. air ind. bulb short circuit'),                 enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'CARBAIR_BREAK_LEADS',                   label = _('Carb. air ind. breaks in leads'),                    enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'CARBAIR_OPEN_CIRCUIT_BLB',              label = _('Carb. air ind. open circuit in bulb'),               enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'HYDR_EXTERNAL_LEAKAGE',                 label = _('External hydro leak'),                               enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'HYDR_INTERNAL_LEAKAGE',                 label = _('Internal hydro leak'),                               enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'HYDR_ACCUMULATOR_LOW_AIR_PRESSURE',     label = _('Hydro acc. low air pressure'),                       enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'HYDR_UNLOAD_VALVE_NOT_LOAD',            label = _('Hydro relief valve stuck in unload'),                enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'HYDR_UNLOAD_VALVE_NOT_UNLOAD',          label = _('Hydro relief valve stuck in load'),                  enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'UNCR_LH_STRUT_DOWN_LOCK_FAILURE',       label = _('Left gear downlock fail'),                           enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'UNCR_RH_STRUT_DOWN_LOCK_FAILURE',       label = _('Right gear downlock fail'),                          enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'UNCR_C_STRUT_DOWN_LOCK_FAILURE',        label = _('Tail gear downlock fail'),                           enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'UNCR_C_STRUT_UP_LOCK_FAILURE',          label = _('Tail gear lock spring broken'),                      enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TAIL_GEAR_FAIL_GO_DOWN',                label = _('Tail gear up-latch cable broken'),                   enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TAIL_GEAR_FAIL_GO_UP',                  label = _('Tail gear down-lock cable broken'),                  enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'TAIL_GEAR_C_CABLE',                     label = _('Tail gear cable jammed'),                            enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'UNCR_LH_STRUT_UP_LOCK_FAILURE',         label = _('Left gear up-latch locked'),                         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'UNCR_RH_STRUT_UP_LOCK_FAILURE',         label = _('Right gear up-latch locked'),                        enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'L_GEAR_DLK_FAULT',                      label = _('Left gear down-lock locked'),                        enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'R_GEAR_DLK_FAULT',                      label = _('Right gear down-lock locked'),                       enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'DOORS_TV_JAMMED',                       label = _('Doors timing valve jammed'),                         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'DOORS_TVC_BROKEN',                      label = _('Doors timing valve cable broken'),                   enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'IGNITION_NO_OUTPUT',                    label = _('Ignition condenser burned out'),                     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'IGNITION_TERM_CONNECT',                 label = _('Ignition terminal connection fault'),                enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'BOOSTER_COIL',                          label = _('Booster coil fault'),                                enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'ELEC_STARTER_LOOM_SEVERED',             label = _('Starter wiring fault'),                              enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ELEC_STARTER_RELAY_FAILURE',            label = _('Starter relay fault'),                               enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ELEC_STARTER_SOLENOID_FAILURE',         label = _('Starter solenoid fault'),                            enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ELEC_GENERATOR_FAILURE',                label = _('Generator failure'),                                 enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ELEC_NAVLIGHT_RED_FAILURE',             label = _('LH nav. light failure'),                             enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ELEC_NAVLIGHT_GREEN_FAILURE',           label = _('RH nav. light failure'),                             enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ELEC_NAVLIGHT_WHITE_FAILURE',           label = _('Aft nav. light failure'),                            enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'FUEL_MAIN_FUEL_PUMP_FAILURE',           label = _('Fuel pump defective'),                               enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'INSUF_FUEL_PRES',                       label = _('Fuel pressure insufficient'),                        enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'CLOGGED_FUEL_STRAINER',                 label = _('Fuel strainer clogged'),                             enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'FUEL_VALVE_LEAK',                       label = _('Fuel valve leak'),                                   enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'FUEL_TANK_00_MINOR_LEAK',               label = _('Left fuel tank leak'),                               enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'FUEL_TANK_01_MINOR_LEAK',               label = _('Right fuel tank leak'),                              enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'FUEL_BOOSTER_FUEL_PUMP_0_FAILURE',      label = _('Left tank pump fault'),                              enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'FUEL_BOOSTER_FUEL_PUMP_1_FAILURE',      label = _('Right tank pump fault'),                             enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'ENG0_BOOST_REGULATOR_MALFUNCTION',      label = _('Boost regulator failure'),                           enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ENG0_GOVERNOR_FAILURE',                 label = _('Prop governor failure'),                             enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ENG0_MAGNETO0',                         label = _('Magneto 1 failure'),                                 enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ENG0_MAGNETO1',                         label = _('Magneto 2 failure'),                                 enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ENG0_JAMMED',                           label = _('Engine jam'),                                        enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'COOLANT_UNPRES',                        label = _('Coolant system unpressurized'),                      enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ELEC_BATTERY_OVERHEAT',                 label = _('Battery overheated'),                                enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'ELEC_STARTER_BURNOUT',                  label = _('Starter burn out'),                                  enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

            { id = 'K14_NO_POWER_SUPPLY',                   label = _('K-14. No power supply.'),                            enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'K14_FIXED_LAMP_DEFECTIVE',              label = _('K-14. Fixed reticle lamp defective'),                enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'K14_MOV_LAMP_DEFECTIVE',                label = _('K-14. Movable reticle lamp defective'),              enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
            { id = 'K14_MOTOR_DEFECTIVE',                   label = _('K-14. Motor defective'),                             enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        },



        lights_data = {
            typename = "collection",
            lights = {
                [WOLALIGHT_STROBES] = {typename = "collection", lights = {}},
                [WOLALIGHT_SPOTS] = {
                    typename = "collection",
                    lights = {
                        {
                            typename = "spotlight",
                            connector = "RESERV_SPOT_PTR",
                            angle_max = 0.87266462599716,
                            argument = 208,
                            dir_correction = {
                                elevation = -0.20943951023932,
                            },
                        },
                    }
                },
                [WOLALIGHT_NAVLIGHTS] = {
                    typename = "collection",
                    lights = {
                        {
                            -- Left Position Light (RED)
                            typename = "omnilight",
                            connector = "BANO_2",
                            color = {0.99, 0.11, 0.3},
                            pos_correction = {0.1, 0.0, -0.2},
                            argument = 190
                        },
                        {
                            -- Right Position Light (GREEN)
                            typename = "omnilight",
                            connector = "BANO_1",
                            color = {0.0, 0.894, 0.6},
                            pos_correction = {0.1, 0.0, 0.2},
                            argument = 191
                        },
                        {
                            -- Tail Position Light (WHITE)
                            typename = "omnilight",
                            connector = "BANO_0",
                            color = {1.0, 1.0, 1.0},
                            --pos_correction = {0.0, 0.0, 0.2},
                            argument = 192
                        }
                    }
                },
                [WOLALIGHT_FORMATION_LIGHTS] = {typename = "collection", lights = {}},
                [WOLALIGHT_TIPS_LIGHTS] = {
                    typename = "collection",
                    lights = {
                        {
                            typename = "spotlight",
                            connector = "FORM_LIGHTS_1",
                            color = {0.99, 0.11, 0.3},
                            argument = 200,
                            --dir_correction = {azimuth = math.rad(90.0)}
                        },
                        {
                            typename = "spotlight",
                            connector = "FORM_LIGHTS_2",
                            color = {1.0, 0.5, 0.0},
                            argument = 202,
                        },
                        {
                            typename = "spotlight",
                            connector = "FORM_LIGHTS_3",
                            color = {0.0, 0.894, 0.6},
                            argument = 201,
                        },
                    }
                },
            }
        },



        ViewSettings = {
            Cockpit = {
                [1] = { -- player slot 1
                    CockpitLocalPoint      = {-1.500, 0.618, 0.000},
                    CameraViewAngleLimits  = {20.0, 120.0},
                    CameraAngleRestriction = {false, 90.0, 0.5},
                    CameraAngleLimits      = {200.0, -80.0, 90.0},
                    EyePoint               = {0.025, 0.100, 0.000},
                    ShoulderSize           = 0.150,
                    Allow360rotation       = false,
                    limits_6DOF            = {x = {-0.050, 0.450}, y ={-0.200, 0.200}, z = {-0.220, 0.220}, roll = 90.0},
                },
            }, -- Cockpit
            Chase = {
                LocalPoint    = {0.200, -0.652, -0.650},
                AnglesDefault = {0.0, 0.0},
            }, -- Chase
            Arcade = {
                LocalPoint    = {-21.500, 5.618, 0.000},
                AnglesDefault = {0.0, -8.0},
            }, -- Arcade 
        },
        SnapViews ={
            [1] = { -- player slot 1
                -- Num0
                [1] = {
                    viewAngle = 80.0, -- FOV
                    x_trans   = 0.120,
                    y_trans   = 0.059,
                    z_trans   = 0.000,
                    hAngle    = 0.0,
                    vAngle    = -45.0,
                    rollAngle = 0.0,
                },

                -- LWin + Num1 - Snap View 1 - LH Board
                [2] = {
                    viewAngle = 80.0, -- FOV
                    x_trans   = 0.120,
                    y_trans   = 0.059,
                    z_trans   = 0.000,
                    hAngle    = 45.0,
                    vAngle    = -45.0,
                    rollAngle = 0.0,
                },

                -- LWin + Num2 - Snap View 2 - Front Panel
                [3] = {
                    viewAngle = 80.0, -- FOV
                    x_trans   = 0.120,
                    y_trans   = 0.059,
                    z_trans   = 0.000,
                    hAngle    = 0.0,
                    vAngle    = -75.0,
                    rollAngle = 0.0,
                },

                -- LWin + Num3 - Snap View 3 - RH Board
                [4] = {
                    viewAngle = 80.0, -- FOV
                    x_trans   = 0.120,
                    y_trans   = 0.059,
                    z_trans   = 0.000,
                    hAngle    = -45.0,
                    vAngle    = -45.0,
                    rollAngle = 0.0,
                },

                -- LWin + Num4 - Snap View 4 - Left 6
                [5] = {
                    viewAngle = 91.040001, -- FOV
                    x_trans   = 0.063872,
                    y_trans   = 0.082888,
                    z_trans   = -0.116148,
                    hAngle    = 157.332764,
                    vAngle    = -28.359503,
                    rollAngle = 0.0,
                },

                -- LWin + Num5 - Snap View 5 - Reticle
                [6] = {
                    viewAngle = 50.0, -- FOV
                    x_trans   = 0.212078,
                    y_trans   = 0.057813,
                    z_trans   = 0.000,
                    hAngle    = 0.0,
                    vAngle    = -8.722581,
                    rollAngle = 0.0,
                },

                -- LWin + Num6 - Snap View 6 - Right 6
                [7] = {
                    viewAngle = 80.0, -- FOV
                    x_trans   = 0.350,
                    y_trans   = 0.059,
                    z_trans   = 0.100,
                    hAngle    = -143.0,
                    vAngle    = 0.0,
                    rollAngle = 0.000000,
                },

                -- LWin + Num7 - Snap View 7 - Left 10
                [8] = {
                    viewAngle = 80.0, -- FOV
                    x_trans   = 0.120,
                    y_trans   = 0.059,
                    z_trans   = 0.000,
                    hAngle    = 45.0,
                    vAngle    = -5.0,
                    rollAngle = 0.0,
                },

                -- LWin + Num8 - Snap View 8 - Cowl
                [9] = {
                    viewAngle = 80.0, -- FOV
                    x_trans   = 0.120,
                    y_trans   = 0.059,
                    z_trans   = 0.000,
                    hAngle    = 0.0,
                    vAngle    = 10.0,
                    rollAngle = 0.0,
                },

                -- LWin + Num9 - Snap View 9 - Right 10
                [10] = {
                    viewAngle = 80.0, -- FOV
                    x_trans   = 0.120,
                    y_trans   = 0.059,
                    z_trans   = 0.000,
                    hAngle    = -45.0,
                    vAngle    = -5.0,
                    rollAngle = 0.0,
                },

                -- Look at Left Mirror
                [11] = {
                    viewAngle = 80.0, -- FOV
                    x_trans   = 0.120,
                    y_trans   = 0.059,
                    z_trans   = 0.000,
                    hAngle    = 0.0,
                    vAngle    = 10.0,
                    rollAngle = 0.0,
                },

                -- Look at Right Mirror
                [12] = {
                    viewAngle = 80.0, -- FOV
                    x_trans   = 0.120,
                    y_trans   = 0.059,
                    z_trans   = 0.000,
                    hAngle    = -20.0,
                    vAngle    = 8.0,
                    rollAngle = 0.0,
                },

                -- Default View
                [13] = {
                    viewAngle = 80.0, -- FOV
                    x_trans   = 0.120,
                    y_trans   = 0.059,
                    z_trans   = 0.000,
                    hAngle    = 0.0,
                    vAngle    = -9.5,
                    rollAngle = 0.0,
                },
            },
        },

        Waypoint_Custom_Panel = true,
        AmmoWeight = 284.96,
        stores_number = 11,
    }

    if rewrite_settings then 
       for i,o in pairs(rewrite_settings) do
            AIRCRAFT[i] = o
       end
    end

    AIRCRAFT.shape_table_data[1].file     = AIRCRAFT.Shape
    AIRCRAFT.shape_table_data[1].username = AIRCRAFT.Name

    return AIRCRAFT
end



-- P-51D-25-NA
add_aircraft(make_P_51D({
    Name                = "P-51D",
    DisplayName         = _("P-51D-25-NA"),
    Shape               = "P-51D-25-NA",
    WorldID = 63,
}))



-- P-51D-30-NA
add_aircraft(make_P_51D({
    Name                = "P-51D-30-NA",
    DisplayName         = _("P-51D-30-NA"),
    Shape               = "P-51D-30-NA",
    WorldID = 64,
}))

