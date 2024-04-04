// package main: Declares the package name.
// The main package is special in Go, it's where the execution of the program starts.

package main

// fmt is short format, it contains functions for formatted I/O.
import (
	//"bytes"
	//"context"
	//"encoding/json"
	//"net/http"
	"fmt"
	"log"
	"github.com/google/uuid"
	//"github.com/hashicorp/terraform-plugin-sdk/v2/diag"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// func main(): Defines the main function, the entry point of the app.
// When you run the program, it starts executing from this function.
func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: Provider,
	})
	//Format.PrintLine
	fmt.Println("Hello, world!")
}

// in golang a titlecase function will get exported
func Provider() *schema.Provider {
	var p *schema.Provider
	p = &schema.Provider{
		ResourcesMap: map[string]*schema.Resource{

		},
		DataSourcesMap: map[string]*schema.Resource{

		},
		Schema: map[string]*schema.Schema{
			"endpoint": {
				Type: schema.TypeString,
				Required: true,
				Description: "The endpoint for the external service",
			},
			"token": {
				Type: schema.TypeString,
				Sensitive: true, // make the token to be sensitive to hide in the logs
				Required: true,
				Description: "Bearer token for authorization",
			},
			"user_uuid" : {
				Type: schema.TypeString,
				Required: true,
				Description: "UUID for configuration",
				ValidateFunc: validateUUID,
			},
		},
	}
	//p.ConfigureContextFunc = providerConfigure(p)
	return p
}

func validateUUID(v interface{}, k string) (ws []string, errors []error) {
	log.Print("validateUUID:start")
	value := v.(string)
	if _, err := uuid.Parse(value); err != nil {
		errors = append(errors, fmt.Errorf("invalid UUID format"))
	}
	log.Print("validateUUID:end")
	return
}

// func providerConfigure(p *schema.Provider) schema.ConfigureContextFunc {
// 	return func(ctx context.Context, d *schema.ResourceData) (interface{}, diag.Diagnostics ) {
// 		log.Print("providerConfigure:start")
// 		config := Config{
// 			Endpoint: d.Get("endpoint").(string),
// 			Token: d.Get("token").(string),
// 			UserUuid: d.Get("user_uuid").(string),
// 		}
// 		log.Print("providerConfigure:end")
// 		return &config, nil
// 	}
// }