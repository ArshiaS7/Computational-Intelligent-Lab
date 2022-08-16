

desired_output = out.Yd1.Data; 
desired_input = out.Xd1.Data(1:end-3);

a1 = [0; desired_output(2:end)];

NNinput = [desired_input desired_output a1];

Target = desired_input;


