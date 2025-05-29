table 50125 Example
 {
     DataClassification = CustomerContent;
     Caption = 'Example';
     LookupPageID = "Example List";
     DrillDownPageID  = "Example List";

     fields
     {
         field(1; "No."; Code[20])
         {
             DataClassification = CustomerContent;
             Caption = 'No.';
         }
         field(2; "Description"; Text[50])
         {
             DataClassification = CustomerContent;
             Caption = 'Description';
         }
         field(3; "Example Type Code"; Code[10])
         {
             DataClassification = CustomerContent;
             Caption = 'Example Type Code';
             TableRelation = ExampleType;
         }
         field(4; "No. Series"; Code[20])
         {
             DataClassification = CustomerContent;
             Caption = 'No.';
         }
         
     }

     keys
     {
         key(Pk; "No.")
         {
             Clustered = true;
         }
     }

     trigger OnInsert();
     begin
         if "No." = '' then begin
             ExampleSetup.Get();
             ExampleSetup.TestField("Example Nos.");
            "No. Series" := ExampleSetup."Example Nos.";         
            if NoSeries.AreRelated(ExampleSetup."Example Nos.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series");
         end;
     end;

     procedure AssistEdit(OldExample: Record Example): Boolean
     var
         Example: Record Example;
     begin
         Example := Rec;
         ExampleSetup.Get();
         ExampleSetup.TestField("Example Nos.");
        if NoSeries.LookupRelatedNoSeries(ExampleSetup."Example Nos.", OldExample."No. Series", Example."No. Series") then begin
            Example."No." := NoSeries.GetNextNo(Example."No. Series");
             Rec := Example;
             exit(true);
         end;
     end;
     var
        NoSeries: Codeunit "No. Series";
        ExampleSetup: Record "Example Setup";
 }