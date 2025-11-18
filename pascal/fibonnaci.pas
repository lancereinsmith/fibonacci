program FibonacciGenerator;

uses crt; { Standard unit for screen handling in Turbo Pascal }

var
  n, choice, termsPerLine: integer;
  t1, t2, nextTerm, sum: LongInt;
  maxValue: LongInt;
  ratio: real;

{ Procedure to display the header }
procedure DisplayHeader;
begin
  TextColor(LightGreen);
  writeln('===============================================');
  writeln('      Enhanced Fibonacci Sequence Generator    ');
  writeln('===============================================');
  TextColor(White);
  writeln;
end;

{ Procedure to display menu options }
procedure DisplayMenu;
begin
  TextColor(Yellow);
  writeln('Generation Options:');
  TextColor(White);
  writeln('  1. Generate by number of terms');
  writeln('  2. Generate up to a maximum value');
  writeln('  3. Display with statistics');
  writeln('  4. Display in columns');
  writeln;
  write('Enter your choice (1-4): ');
end;

{ Procedure to generate and display Fibonacci sequence }
procedure GenerateFibonacci(termCount: integer; showStats: boolean; columnMode: boolean);
var
  j: integer;
begin
  t1 := 0;
  t2 := 1;
  sum := 0;
  termsPerLine := 10;

  if columnMode then
  begin
    TextColor(Cyan);
    writeln('Fibonacci Sequence (', termCount, ' terms):');
    TextColor(White);
    writeln;
  end
  else
  begin
    TextColor(Cyan);
    writeln('Fibonacci Sequence:');
    TextColor(White);
  end;

  { Handle the first term }
  if termCount >= 1 then
  begin
    if columnMode then
      write(t1:12)
    else
      write(t1, ' ');
    sum := sum + t1;
  end;

  { Handle the second term }
  if termCount >= 2 then
  begin
    if columnMode then
      write(t2:12)
    else
      write(t2, ' ');
    sum := sum + t2;
  end;

  { Calculate and print remaining terms }
  for j := 3 to termCount do
  begin
    nextTerm := t1 + t2;
    
    if columnMode then
    begin
      write(nextTerm:12);
      if (j mod termsPerLine) = 0 then
        writeln;
    end
    else
      write(nextTerm, ' ');
    
    sum := sum + nextTerm;
    
    t1 := t2;
    t2 := nextTerm;
  end;
  
  writeln;
  writeln;

  { Display statistics if requested }
  if showStats then
  begin
    TextColor(LightMagenta);
    writeln('Statistics:');
    TextColor(White);
    writeln('  Number of terms: ', termCount);
    writeln('  Sum of all terms: ', sum);
    writeln('  Average value: ', (sum / termCount):0:2);
    if termCount >= 2 then
    begin
      writeln('  Last term: ', t2);
      writeln('  Second-to-last term: ', t1);
      if t1 <> 0 then
      begin
        ratio := t2 / t1;
        writeln('  Ratio (F(n)/F(n-1)): ', ratio:0:10);
        writeln('  Golden Ratio (φ): 1.6180339887');
        writeln('  Difference: ', abs(ratio - 1.6180339887):0:10);
      end;
    end;
    writeln;
  end;
end;

{ Procedure to generate up to a maximum value }
procedure GenerateUpToMax(maxVal: LongInt);
var
  count: integer;
begin
  t1 := 0;
  t2 := 1;
  count := 0;

  TextColor(Cyan);
  writeln('Fibonacci Sequence up to ', maxVal, ':');
  TextColor(White);
  writeln;

  if maxVal >= 0 then
  begin
    write(t1, ' ');
    count := count + 1;
  end;

  if maxVal >= 1 then
  begin
    write(t2, ' ');
    count := count + 1;
  end;

  while (t1 + t2) <= maxVal do
  begin
    nextTerm := t1 + t2;
    write(nextTerm, ' ');
    count := count + 1;
    t1 := t2;
    t2 := nextTerm;
  end;

  writeln;
  writeln;
  TextColor(LightMagenta);
  writeln('Total terms generated: ', count);
  TextColor(White);
  writeln;
end;

{ Main program }
begin
  { Clear the terminal screen }
  clrscr;
  
  DisplayHeader;
  DisplayMenu;
  readln(choice);
  writeln;

  case choice of
    1: begin
         write('Enter the number of terms to generate (max 46): ');
         readln(n);
         writeln;
         
         if n <= 0 then
         begin
           TextColor(Red);
           writeln('Error: Please enter a positive integer.');
         end
         else if n > 46 then
         begin
           TextColor(Red);
           writeln('Error: Maximum 46 terms supported with LongInt.');
           writeln('Using 46 terms instead.');
           TextColor(White);
           n := 46;
           writeln;
           GenerateFibonacci(n, false, false);
         end
         else
           GenerateFibonacci(n, false, false);
       end;
       
    2: begin
         write('Enter the maximum value: ');
         readln(maxValue);
         writeln;
         
         if maxValue < 0 then
         begin
           TextColor(Red);
           writeln('Error: Please enter a non-negative value.');
         end
         else
           GenerateUpToMax(maxValue);
       end;
       
    3: begin
         write('Enter the number of terms to generate (max 46): ');
         readln(n);
         writeln;
         
         if n <= 0 then
         begin
           TextColor(Red);
           writeln('Error: Please enter a positive integer.');
         end
         else if n > 46 then
         begin
           TextColor(Red);
           writeln('Error: Maximum 46 terms supported with LongInt.');
           writeln('Using 46 terms instead.');
           TextColor(White);
           n := 46;
           writeln;
           GenerateFibonacci(n, true, false);
         end
         else
           GenerateFibonacci(n, true, false);
       end;
       
    4: begin
         write('Enter the number of terms to generate (max 46): ');
         readln(n);
         writeln;
         
         if n <= 0 then
         begin
           TextColor(Red);
           writeln('Error: Please enter a positive integer.');
         end
         else if n > 46 then
         begin
           TextColor(Red);
           writeln('Error: Maximum 46 terms supported with LongInt.');
           writeln('Using 46 terms instead.');
           TextColor(White);
           n := 46;
           writeln;
           GenerateFibonacci(n, false, true);
         end
         else
           GenerateFibonacci(n, false, true);
       end;
       
    else
      begin
        TextColor(Red);
        writeln('Invalid choice. Using default mode (option 1).');
        TextColor(White);
        writeln;
        write('Enter the number of terms to generate (max 46): ');
        readln(n);
        writeln;
        if n > 0 then
          GenerateFibonacci(n, false, false);
      end;
  end;

  writeln;
  TextColor(LightGray);
  writeln('Press ENTER to exit...');
  readln;
end.