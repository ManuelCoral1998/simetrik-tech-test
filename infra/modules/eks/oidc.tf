data "tls_certificate" "eks_tls_certificate" {
  url = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks_connect_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks_tls_certificate.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

resource "aws_eks_identity_provider_config" "identity_provider_config" {
  cluster_name = aws_eks_cluster.cluster.name
  oidc {
    client_id = "${substr(aws_eks_cluster.cluster.identity[0].oidc[0].issuer, -32, -1)}"
    identity_provider_config_name = "eks-cluster"
    issuer_url = "https://${aws_iam_openid_connect_provider.eks_connect_provider.url}"
  }
}

