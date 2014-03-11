class ApplicationController < ActionController::Base
protect_from_forgery

def pdf
  pdf_path = Rails.root.join("config", "test.pdf")
  send_data(File.open(pdf_path).read, filename: "test.pdf")
end

def rules_engine_simulator
  result = [
      {
          "pmd_cde_id" => 100000001,
          "cde_dtp_id" => 267249,
          "id" =>10550583,
          "parent_id" =>10033,
          "patient_id" =>params[:pmd_patient_id],
          "category" =>"Needs Additional Drug Therapy",
          "subcategory" =>"Evidence-Based Medicine Recommends Additional Medication",
          "status" => nil,
          "time_to_clinical_impact" =>"1-30 days",
          "time_to_financial_impact" =>"31-90 days",
          "question" =>"Is the patient on the BEST medications to treat their medical conditions",
          "rule_identifier" => "300-8",
          "severity" =>"Major",
          "description" =>"High cholesterol - starting a cholesterol medicine ",
          "rationale" =>"Hypercholesterolemia, elevated low-density lipoprotein (LDL) levels, and low high-density lipoprotein (HDL) levels are unequivocally linked to increased risk for coronary heart disease and cerebrovascular morbidity and mortality. LDL is the primary target. Decreasing elevated total cholesterol and low-density lipoprotein cholesterol (LDL-C) levels reduce coronary heart disease mortality and total mortality; increasing HDL reduces coronary heart disease events as well. Aggressive treatment of hypercholesterolemia results in fewer patients progressing to myocardial infarction, angina, and stroke and reduces the need for interventions such as coronary artery bypass graft and percutaneous transluminal coronary angioplasty.[Expert Panel on Detection, Evaluation, and Treatment of High Blood Cholesterol in Adults (Adult Treatment Panel III). Executive Summary of the Third Report of the National Cholesterol Education Program (NCEP). (2002). NIH Publication 02-5215. Available at http =>//www.nhlbi.nih.gov/guidelines/cholesterol/atp3full.pdf]",
          "disease_category_id" =>3,
          "score" =>72.0,
          "interventions" => [
              {
                  "cde_interventions_id" =>2,
                  "id" =>3488559,
                  "cde_dtp_id" =>267249,
                  "drug_therapy_problem_id" =>10550583,
                  "status" =>"identified",
                  "endpoint_type" =>"Patient",
                  "intervention_type" =>"Refer Patient to Physician",
                  "recommendation_details" =>"Please talk to your doctor about adding a medicine to lower your cholesterol.",
                  "expected_result" =>"Patient will take medication as prescribed and not miss doses.",
                  "Links" => [
                      {
                          "Rel" =>"self",
                          "Href" =>"/intervention/2",
                          "Title" =>"self",
                          "Type" => nil
                      },
                      {
                          "Rel" =>"all",
                          "Href" =>"/intervention",
                          "Title" =>"All Interventions",
                          "Type" => nil
                      }
                  ]
              },
              {
                  "cde_interventions_id" =>3,
                  "id" =>3488558,
                  "cde_dtp_id" =>267249,
                  "drug_therapy_problem_id" =>10550583,
                  "status" =>"identified",
                  "endpoint_type" =>"Prescriber",
                  "intervention_type" =>"Add Medication",
                  "recommendation_details" =>"Your patient has a diagnosis of dyslipidemia and is not taking a cholesterol lowering medication. Please consider adding appropriate therapy.",
                  "expected_result" =>"Patient does not have a lipid lowering medication in their profile and has dyslipidemia.",
                  "Links" =>[
                      {
                          "Rel" =>"self",
                          "Href" =>"/intervention/3",
                          "Title" =>"self",
                          "Type" => nil
                      },
                      {
                          "Rel" =>"all",
                          "Href" =>"/intervention",
                          "Title" =>"All Interventions",
                          "Type" => nil
                      }
                  ]
              }
          ],
          "medications" =>[
              {
                  "id" =>34264,
                  "cde_dtp_id" =>267249,
                  "medication_id" =>2805439,
                  "drug_therapy_problem_id" =>10550583,
                  "pmd_cde_id" =>100001108,
                  "Links" =>[
                      {
                          "Rel" =>"self",
                          "Href" =>"/dtpmedication/34264",
                          "Title" =>"self",
                          "Type" => nil
                      },
                      {
                          "Rel" =>"all",
                          "Href" =>"/dtpmedication",
                          "Title" =>"All DTP Medications",
                          "Type" => nil
                      }
                  ]
              }
          ],
          "Links" =>[
              {
                  "Rel" =>"self",
                  "Href" =>"/drugTherapyProblem/267249",
                  "Title" =>"self",
                  "Type" => nil
              },
              {
                  "Rel" =>"all",
                  "Href" =>"/drugTherapyProblem",
                  "Title" =>"All DTPs",
                  "Type" => nil
              }
          ]
      }
  ]
  render json: result
end
end
