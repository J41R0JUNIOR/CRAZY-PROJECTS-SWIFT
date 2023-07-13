
import SpriteKit

class CamadaLogica {
    var estadoDoJogo: Estado = .Nenhum
    var camadaVisual: CamadaVisual?
    
    private var pontuacao: Pontuacao = Pontuacao()
    
//    override init() {
//    }
}

extension CamadaLogica: PecaDelegate{
    func pegarEstado() -> Estado {
        if self.estadoDoJogo == .Nenhum{
            self.estadoDoJogo = .X
        }
        return self.estadoDoJogo
    }
    
    func checarSeacabou() {
        //Checagem se alguem ganhou
        if self.estadoDoJogo == .X {
            pontuacao.pontuacaoX += 1
        } else {
            pontuacao.pontuacaoO += 1
        }
        camadaVisual?.atualizarPontos(pontuacao: pontuacao)
        
        self.estadoDoJogo = self.estadoDoJogo.pegarContrario()
    }
}
