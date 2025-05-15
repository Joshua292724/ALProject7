table 50124 "Example Setup"
 {
     Caption = 'Example Setup';
     DataClassification = CustomerContent;

     fields
     {
         field(1; "Primary Key"; Code[10])
         {
             Caption = 'Primary Key';
         }
         field(2; "Example Nos."; Code[20])
         {
             Caption = 'Example Nos.';
             TableRelation = "No. Series";
         }
         field(3; "Document Nos."; Code[20])
        {
            Caption = 'Document Nos.';
            TableRelation = "No. Series";
        }
     }
     keys
     {
         key(Key1; "Primary Key")
         {
             Clustered = true;
         }
     }
 }