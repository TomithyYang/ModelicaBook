within ModelicaByExample.Components.LotkaVolterra.Examples;
model ThirdSpecies "Adding a third species to Lotka-Volterra"
  extends ClassicLotkaVolterra;
  Components.RegionalPopulation wolves(init=ModelicaByExample.Components.LotkaVolterra.Components.RegionalPopulation.InitializationOptions.FixedPopulation,
      initial_population=10)
    annotation (Placement(transformation(extent={{50,70},{70,90}})));
  Components.Starvation wolf_starvation(gamma=0.4)
    annotation (Placement(transformation(extent={{10,70},{30,90}})));
  Components.Predation wolf_predation(beta=0.04, delta=0.08)
    "Wolves eating Foxes" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,40})));
equation
  connect(wolf_starvation.species, wolves.species) annotation (Line(
      points={{20,80},{60,80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(wolf_predation.b, wolves.species) annotation (Line(
      points={{60,50},{60,80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(wolf_predation.a, foxes.species) annotation (Line(
      points={{60,30},{60,0}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end ThirdSpecies;