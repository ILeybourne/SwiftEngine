
import simd

enum CameraTypes {
    case Debug
}

class Camera: Node {
    var cameraType: CameraTypes!
    
    private var _facing: float3 = float3();
    private var _cameraPos: float3 = float3();

    
    private var _viewMatrix = matrix_identity_float4x4
    var viewMatrix: matrix_float4x4 {
        return _viewMatrix
    }
    
    var getCameraPosition: float3{
        return _cameraPos
    }
    
    var projectionMatrix: matrix_float4x4 {
        return matrix_identity_float4x4
    }
    
    init(name: String, cameraType: CameraTypes){
        super.init(name: name)
        self.cameraType = cameraType
    }
    
//    var _facing = float3(x:getPosition().x ,y: ,z:);

    
    override func moveX(_ delta: Float){ move(cos(self.getRotationY()) * delta, 0, sin(self.getRotationY()) * delta) }
    override func moveY(_ delta: Float){ move(0, delta, 0) }
    override func moveZ(_ delta: Float){ move(cos(self.getRotationY() + Float(M_PI / 2)) * delta, 0, sin(self.getRotationY() + Float(M_PI / 2)) * delta) }
    
//    override func moveZ(_ delta: Float){ move(0, 0, 1) }
    
    override func updateModelMatrix() {
        _viewMatrix = matrix_identity_float4x4
        _viewMatrix.rotate(angle: self.getRotationX(), axis: X_AXIS)
        _viewMatrix.rotate(angle: self.getRotationY(), axis: Y_AXIS)
        _viewMatrix.rotate(angle: self.getRotationZ(), axis: Z_AXIS)
        _viewMatrix.translate(direction: -getPosition())
        print("self.getRotationZ()")
        print(self.getRotationY())
    }
}
