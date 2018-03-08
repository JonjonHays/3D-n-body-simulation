% This script file is used to create a .mat file containing multiple
% ephemeris matrices for easy loading of multiple scenarios. These particular  
% ephemerides were generated using NASA Jet Propulsion Lab's ephemeris
% generator. Each row of the ephemeris matrices corresponds to a different
% gravitational body; the columns of the matrix correspond to x-position, 
% y-position, z-position, x-velocity, y-velocity, z-velocity, and mass 
% respectively. simple_solar_system contains ephemeris data for the Sun,
% Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune, and Pluto
% respectively. solar_system_plus contains all the planets in
% simple_solar_system, plus earth's moon (luna); Jupiter's moons lo, Europa,
% Ganymede, and Callisto; Saturn's moons Rhea, Dione, Tethys, Titan, and 
% Iapetus; Neptune's moons Triton; Uranus' moons Oberon, Titania, Umbriel, 
% and Ariel respectively. For these particular ephemerides, the units are in 
% km, km/s, and kg; simulation start time is May 9, 2015 at 00:00:00. 

clear;



simple_solar_system = [5.626103502926079e05  3.443226728906326e05 -2.436423881476089e04 -7.773324883987282e-04  1.210822659373845e-02 -9.778450920580606e-07 1.988544e30; 
                     -4.513662007660432E+07 -4.927389596028828E+07  1.138315754199736E+05 2.593356262815355E+01 -3.075283122194525E+01 -4.893112957376951E+00 3.302e23;
                     9.431348388205439E+07  5.446771610256303E+07 -4.692279629865762E+06 -1.761891920524219E+01  3.019059650961939E+01  1.430453909689927E+00 48.685e23;
                     -9.935221810532913E+07 -1.129154628059938E+08 -1.932305383689702E+04 2.186471594524899E+01 -1.980944044454448E+01  7.025280109829168E-04 5.97219e24;
                     -1.328134250720929E+08 -1.873552832615962E+08 -6.843534460376799E+05 2.066070520592737E+01 -1.194566983823664E+01 -7.576734425188629E-01 6.4185e23;
                     -8.061407499659101E+08  1.027879153420814E+08  1.760119685928192E+07 -1.803551171032804E+00 -1.234452571526842E+01  9.168220370339686E-02 1898.13e24;
                     -4.597343883448215E+08 -1.426519619497385E+09  4.310021674940681E+07 8.664180217015362E+00 -2.993713904647570E+00 -2.921967274703661E-01 5.68319e26;
                     2.796892102838130E+09  1.048440084850199E+09 -3.234039955236858E+07 -2.439984805399456E+00  6.059217277121001E+00  5.412385813122622E-02 86.8103e24;
                     4.202949095092784E+09 -1.555039174320794E+09 -6.483815114876616E+07 1.849458897117543E+00  5.130255175425704E+00 -1.475645718616410E-01 102.41e24;
                     1.336505841758350E+09 -4.765181919315390E+09  1.233082852891345E+08 5.355308524502379E+00  3.438872515107957E-01 -1.604782083088432E+00 1.307e22];
                 
solar_system_plus = [5.626103502926079e05  3.443226728906326e05 -2.436423881476089e04 -7.773324883987282e-04  1.210822659373845e-02 -9.778450920580606e-07 1.988544e30; 
                     -4.513662007660432E+07 -4.927389596028828E+07  1.138315754199736E+05 2.593356262815355E+01 -3.075283122194525E+01 -4.893112957376951E+00 3.302e23;
                     9.431348388205439E+07  5.446771610256303E+07 -4.692279629865762E+06 -1.761891920524219E+01  3.019059650961939E+01  1.430453909689927E+00 48.685e23;
                     -9.935221810532913E+07 -1.129154628059938E+08 -1.932305383689702E+04 2.186471594524899E+01 -1.980944044454448E+01  7.025280109829168E-04 5.97219e24;
                     -1.328134250720929E+08 -1.873552832615962E+08 -6.843534460376799E+05 2.066070520592737E+01 -1.194566983823664E+01 -7.576734425188629E-01 6.4185e23;
                     -8.061407499659101E+08  1.027879153420814E+08  1.760119685928192E+07 -1.803551171032804E+00 -1.234452571526842E+01  9.168220370339686E-02 1898.13e24;
                     -4.597343883448215E+08 -1.426519619497385E+09  4.310021674940681E+07 8.664180217015362E+00 -2.993713904647570E+00 -2.921967274703661E-01 5.68319e26;
                     2.796892102838130E+09  1.048440084850199E+09 -3.234039955236858E+07 -2.439984805399456E+00  6.059217277121001E+00  5.412385813122622E-02 86.8103e24;
                     4.202949095092784E+09 -1.555039174320794E+09 -6.483815114876616E+07 1.849458897117543E+00  5.130255175425704E+00 -1.475645718616410E-01 102.41e24;
                     1.336505841758350E+09 -4.765181919315390E+09  1.233082852891345E+08 5.355308524502379E+00  3.438872515107957E-01 -1.604782083088432E+00 1.307e22;
                     -6.636753018575899E-01 -7.524052925595291E-01 -3.455687801014670E-04  1.202306161386847E-02 -1.129375226830239E-02 -2.894487082923546E-06 734.9e20;
                     -5.385913139354945E+00  6.869132896827720E-01  1.176915261315881E-01 -3.680516895518492E-04  2.883812876212249E-03  4.170920127101219E-04 893.3e20;
                     -5.392706464178911E+00  6.890658353716590E-01  1.176792284954107E-01 -4.611755757013654E-03 -1.428136018510641E-02 -3.194792694918071E-04 479.7e20;
                     -5.394362587821465E+00  6.915213324990162E-01  1.177498126612404E-01 -4.906958596249416E-03 -1.205738683795355E-02 -1.840528721746625E-04 1482e20;
                     -5.378213121175639E+00  6.938676107356395E-01  1.180128786957081E-01 -3.613492546140372E-03 -3.114515902833551E-03  1.461867709784842E-04 1076e20;
                     -3.076125030081714E+00 -9.537225019827066E+00  2.891756045227196E-01 7.568123799798539E-03 -5.526497142150413E-03  1.560796680379150E-03 230.9e19;
                     -3.070768425425742E+00 -9.535029439368357E+00  2.875307502808163E-01 3.036260994628644E-03  3.168449509730082E-03 -2.544135787525745E-03 109.572e19;
                     -3.074550426365620E+00 -9.536864381226643E+00  2.888186439342574E-01 9.539513730650463E-03 -6.068681348436605E-03  1.725325615141347E-03 61.76e19;
                     -3.065753291766354E+00 -9.538514469242093E+00  2.888290742120001E-01 6.177377766937554E-03  9.746740221571000E-04 -1.678774510380145E-03 13455.3e19;
                     -3.055822481219930E+00 -9.551422780154459E+00  2.882587338779263E-01 6.208403302906423E-03 -3.454035092676959E-04 -7.323445000599535E-04 180.59e19;
                     2.809674100973264E+01 -1.039321007104522E+01 -4.333222018713277E-01 2.204414850337537E-03  1.815972263247094E-03 -2.040090463950394E-03 214.7e20;
                     1.869933483222846E+01  7.007411806456910E+00 -2.180599721679488E-01 -2.323244569400492E-03  3.473923560811789E-03 -1.547010535350607E-03 30.14e20;
                     1.869511430379496E+01  7.008214027895897E+00 -2.189287643548347E-01 -3.349359596314177E-03  4.014971974534142E-03  6.716870103430535E-04 35.27e20;
                     1.869490966545423E+01  7.008456245586418E+00 -2.175263359140132E-01 -3.366725113107605E-03  4.166597369443234E-03  1.764406909409731E-03 11.72e20;
                     1.869597070382554E+01  7.008584806990712E+00 -2.149255161245066E-01 1.692144665067371E-03  2.867045304284989E-03  3.706604884382856E-04 13.53e20]


% Oops! Had to convert from AU and AU/day to km and km/s..
solar_system_plus(11:25, 1:3) = solar_system_plus(11:25, 1:3)*1.496e8;
solar_system_plus(11:25, 4:6) = solar_system_plus(11:25, 4:6)*1.496e8/86400;

 
save my_ephemerides.mat simple_solar_system solar_system_plus




  