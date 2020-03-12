require_relative '../../lib/thinreports'
require 'pathname'

def generate_pdf
  Thinreports.generate(PARAMS)
end

PARAMS = {
  type: :section,
  layout_file: Pathname(__dir__).join('template.tlf').to_s,
  params: {
    groups: [{
      headers: {
        invoice_header: {
          items: {
            issue_date: "2020年03月05日",
            invoice_number: "20200305-002",
            recipient_info: {
              rows: {
                recipient_name_row: {
                  items: {
                    recipient_name: "サンプル株式会社 様"
                  }
                },
                recipient_notes_row: {
                  display: false
                },
                subject_row: {
                  items: {
                    subject: "件名:テスト件名"
                  }
                },
                payment_due_on_row: {
                  items: {
                    payment_due_on: "2020年03月06日"
                  }
                },
                price_row: {
                  items: {
                    total_amount_price: "¥ 64,900 -"
                  }
                }
              }
            },
            sender_info: {
              rows: {
                logo_image_row: {
                  items: {
                    logo_image: StringIO.new(Pathname(__dir__).join('image.png').binread)
                  }
                },
                sender_name_row: {
                  items: {
                    sender_name: "テスト株式会社",
                    stamp_image: StringIO.new(Pathname(__dir__).join('image.png').binread)
                  }
                },
                sender_zip_code_row: {
                  items: {
                    sender_zip_code: "〒000-0000"
                  }
                },
                sender_address_row: {
                  items: {
                    sender_address: "あああああああああああああああ\nいいいいい\nううううううう"
                  }
                },
                sender_tel_row: {
                  items: {
                    sender_tel: "052-0000-9999"
                  }
                },
                sender_fax_row: {
                  items: {
                    sender_fax: "03-8888-0000"
                  }
                },
                sender_email_row: {
                  items: {
                    sender_email: "test@example.com"
                  }
                }
              }
            },
            invoice_title: "請求書"
          }
        },
        detail_header: {
          min_height: 25.0
        }
      },
      details: [
        {
          id: :detail_body,
          min_height: 25.0,
          items: {
            name: "品名品名品名品名品名品名品名品名品名品名品名品名",
            quantity: "1 個",
            unit_price: "50,000",
            total_amount: "50,000"
          }
        },
        {
          id: :detail_body,
          min_height: 25.0,
          items: {
            name: "品名品名品名品名品名品名品名品名品名品名品名品名",
            quantity: "1 個",
            unit_price: "1,000",
            total_amount: "1,000"
          }
        },
        {
          id: :detail_body,
          min_height: 25.0,
          items: {
            name: "品名品名品名品名品名品名品名品名品名品名品名品名",
            quantity: "10 個",
            unit_price: "100",
            total_amount: "1,000"
          }
        },
        {
          id: :detail_body,
          min_height: 25.0,
          items: {
            name: "品名品名品名品名品名品名品名品名品名品名品名品名",
            quantity: "100 個",
            unit_price: "10",
            total_amount: "1,000"
          }
        },
        {
          id: :detail_body,
          min_height: 25.0,
          items: {
            name: "品名品名品名品名品名品名品名品名品名品名品名品名",
            quantity: "1",
            unit_price: "1,000",
            total_amount: "1,000"
          }
        },
        {
          id: :detail_body,
          min_height: 25.0,
          items: {
            name: "品名品名品名品名品名品名品名品名品名品名品名品名",
            quantity: "1",
            unit_price: "1,000",
            total_amount: "1,000"
          }
        },
        {
          id: :detail_body,
          min_height: 25.0,
          items: {
            name: "品名品名品名品名品名品名品名品名品名品名品名品名",
            quantity: "1",
            unit_price: "1,000",
            total_amount: "1,000"
          }
        },
        {
          id: :detail_body,
          min_height: 25.0,
          items: {
            name: "品名品名品名品名品名品名品名品名品名品名品名品名",
            quantity: "1",
            unit_price: "1,000",
            total_amount: "1,000"
          }
        },
        {
          id: :detail_body,
          min_height: 25.0,
          items: {
            name: "品名品名品名品名品名品名品名品名品名品名品名品名",
            quantity: "1",
            unit_price: "1,000",
            total_amount: "1,000"
          }
        },
        {
          id: :detail_body,
          min_height: 25.0,
          items: {
            name: "品名品名品名品名品名品名品名品名品名品名品名品名",
            quantity: "1",
            unit_price: "1,000",
            total_amount: "1,000"
          }
        }
      ],
      footers: {
        total_prices: {
          items: {
            desc_for_reduced_tax_8: {
              display: false
            },
            prices: {
              rows: {
                sub_total_price_row: {
                  min_height: 25.0,
                  items: {
                    price: "59,000"
                  }
                },
                tax_price_row: {
                  min_height: 25.0,
                  items: {
                    price: "5,900",
                    tax_label: "(10%)"
                  }
                },
                amount_of_withholding_tax_row: {
                  display: false
                },
                total_amount_price_row: {
                  min_height: 25.0,
                  items: {
                    price: "64,900"
                  }
                }
              }
            }
          }
        },
        tax_prices: {
          display: false
        },
        notes: {
          items: {
            notes:
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお\n" +
              "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお"
          }
        }
      }
    }]
  }
}
