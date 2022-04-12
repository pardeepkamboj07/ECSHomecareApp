export class Medicationcs
{
    MedicationID:number;
    StartDate :string;
    EndDate: string;
     MedicationText:string;
     NDCText:string;
     StrengthText:string;
     DosageText:string;
     FrequencyText:string;
     RouteText:string;
     TabsText:string;
     PrescriberText:string;
     ClassificationText:string;
     InstructionsText:string;
     Reminderscheck:boolean;
     Instructionscheck:boolean;
     administrationcheck:boolean;
     selfadministercheck:boolean;  
     ClientID:number;    
     constructor(_StartDate:string, _EndDate: string,_MedicationText:string,_NDCText:string,_StrengthText:string,
        _DosageText:string,_FrequencyText:string,_RouteText:string,_TabsText:string,_PrescriberText:string,_ClassificationText:string,
        _InstructionsText:string,_Reminderscheck:boolean,_Instructionscheck:boolean,_administrationcheck:boolean,
        _selfadministercheck:boolean,_ClientID:number){

            this.StartDate=_StartDate;
            this.EndDate=_EndDate;
            this.MedicationText=_MedicationText;
            this.NDCText=_NDCText;
            this.StrengthText=_StrengthText;
            this.DosageText=_DosageText;
            this.FrequencyText=_FrequencyText;
            this.RouteText=_RouteText;
            this.TabsText=_TabsText;
            this.PrescriberText=_PrescriberText;
            this.ClassificationText=_ClassificationText;
            this.InstructionsText=_InstructionsText;
            this.Reminderscheck=_Reminderscheck;
            this.Instructionscheck=_Instructionscheck;
            this.administrationcheck=_administrationcheck;
            this.selfadministercheck=_administrationcheck;
            this.ClientID=_ClientID;

     }
}