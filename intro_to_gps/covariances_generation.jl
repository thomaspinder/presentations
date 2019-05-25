using Distributions
using GaussianProcesses
using Gadfly


# Normal Distribution Sample
gdist = Normal(0, 1)
gsamples = rand(gdist, 10)
plot(x=gsamples, Geom.density(bandwidth=1))


# Multivariate Normal Visualisations
function plotmvn(cov)
    samples = rand(MultivariateNormal([0, 0], cov), 100)
    p = plot(x=samples[1,:], y=samples[2,:],
            Geom.ellipse,
            layer(Geom.ellipse(levels=[0.01, 0.2, 0.4, 0.6, 0.8])),
            Theme(key_position=:none)
            )
    return p
end

c1 = [1 .99; .99 1]
c2 = [1 .7; .7 1]
c3 = [1 .4; .4 1]
c4 = [1 .01; .01 1]

gridstack([plotmvn(c1) plotmvn(c2); plotmvn(c3) plotmvn(c4)])
