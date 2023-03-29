resource "kubernetes_secret" "fdx-docker-registry" {
    metadata {
        name = "fdx-docker-registry"
    }
    
    type = "kubernetes.io/dockerconfigjson"

    data = {
        ".dockerconfigjson" = jsonencode({
            auths = {
                "docker-registry.financialdataexchange.org" = {
                    "username" = var.fdx_dockerhub_username
                    "password" = var.fdx_dockerhub_password
                    "auth"     = base64encode("${var.fdx_dockerhub_username}:${var.fdx_dockerhub_password}")
                }
            }
        })
    }
}

resource "kubernetes_secret" "fdx-jwks-secret" {
    metadata {
        name = "fdx-jwks-secret"
    }
    
    type = "nginx.org/jwk"

    data = {
        "jwk" = "eyJrZXlzIjpbeyJrdHkiOiJSU0EiLCJ1c2UiOiJzaWciLCJraWQiOiJyMUxrYkJvMzkyNVJiMlpGRnJLeVUzTVZleDlUMjgxN0t4MHZiaTZpX0tjIiwiZSI6IkFRQUIiLCJuIjoieHdRNzJQOXo5T1lzaGlRLW50RFlhUG5uZndHNnU5SkFkTE1aNW8wZG1qbGN5cnZ3UVJkb0ZJS1BuTzY1UThtaDZGX0xEU3hqeGEyWXpvX3dkamhiUFpMamZVSlhnQ3ptNTRjQ2xYelQ1dHd6bzdsem9BZmFKbGtUc29aYzJIRldxbWNyaTBCdXptVEZMWngyUTd3WUJtMHBYSG1RS0YwVi1DMU82TldmZDRtZkJoYk0tSTF0SFlTcEFNZ2FyU20yMldETUR4LVdXSTdURXp5MlFoYUJWYUVOVzlCS2FLa0prbG9jQVpDeGsxOFdoUjBmY2tJR2lXaVNNNUZjVTFQWTJqZkdzVG1YNTA1VWI3UDVEejc1WWdxcnV0ZDV0RnJjcXlQQXRQVEZEazhYMUlueGtrVXdwUDNuRlU1bzUwREdod1FvbEdZS1BHdFEtWnRtYk9mY1dRIn0seyJrdHkiOiJFQyIsInVzZSI6InNpZyIsImtpZCI6Ik1GWmVHMTAyZFFpcWJBTm9hTWxXX0ptZjdmT1ptdFJzSHQ3N0pGaFRwRjAiLCJhbGciOiJFUzI1NiIsImNydiI6IlAtMjU2IiwieCI6IkZXWjlyU2tMdDZEeDlFM3B4THliaGRNNnhnUjVvYkdzajVfcHFtbno1SjQiLCJ5IjoiX244RzY5Qy1BMlhsNHhVVzJsRjBpOFpHWm5rX0tQWXJodjRHYlRHdTVHNCJ9XX0="
    }
}

